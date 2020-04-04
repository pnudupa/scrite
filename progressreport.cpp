/****************************************************************************
**
** Copyright (C) Prashanth Udupa, Bengaluru
** Email: prashanth.udupa@gmail.com
**
** This code is distributed under GPL v3. Complete text of the license
** can be found here: https://www.gnu.org/licenses/gpl-3.0.txt
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/

#include "progressreport.h"

ProgressReport::ProgressReport(QObject *parent)
               :QObject(parent),
                m_progress(1.0),
                m_progressStep(0.0),
                m_proxyFor(nullptr)
{

}

ProgressReport::~ProgressReport()
{
    emit aboutToDelete(this);
}

void ProgressReport::setProxyFor(ProgressReport *val)
{
    if(m_proxyFor == val)
        return;

    if(m_proxyFor != nullptr)
    {
        disconnect(m_proxyFor, &ProgressReport::aboutToDelete, this, &ProgressReport::clearProxyFor);
        disconnect(m_proxyFor, &ProgressReport::progressTextChanged, this, &ProgressReport::updateProgressTextFromProxy);
        disconnect(m_proxyFor, &ProgressReport::progressChanged, this, &ProgressReport::updateProgressFromProxy);
    }

    m_proxyFor = val;

    if(m_proxyFor != nullptr)
    {
        connect(m_proxyFor, &ProgressReport::aboutToDelete, this, &ProgressReport::clearProxyFor);
        connect(m_proxyFor, &ProgressReport::progressTextChanged, this, &ProgressReport::updateProgressTextFromProxy);
        connect(m_proxyFor, &ProgressReport::progressChanged, this, &ProgressReport::updateProgressFromProxy);

        this->setProgressText(m_proxyFor->progressText());
        this->setProgress(m_proxyFor->progress());
    }
    else
    {
        this->setProgressText(QString());
        this->setProgress(1.0);
    }

    emit proxyForChanged();
}

void ProgressReport::setProgressText(const QString &val)
{
    if(m_progressText == val)
        return;

    m_progressText = val;
    emit progressTextChanged();
}

void ProgressReport::setProgress(qreal val)
{
    val = qBound(0.0, val, 1.0);
    if( qFuzzyCompare(m_progress, val) )
        return;

    m_progress = val;
    emit progressChanged();

    if( qFuzzyCompare(m_progress,0.0) )
        emit progressStarted();
    else if( qFuzzyCompare(m_progress,1.0) )
        emit progressFinished();
}

void ProgressReport::clearProxyFor()
{
    this->setProxyFor(nullptr);
}

void ProgressReport::updateProgressTextFromProxy()
{
    if(m_proxyFor != nullptr)
        this->setProgressText(m_proxyFor->progressText());
}

void ProgressReport::updateProgressFromProxy()
{
    if(m_proxyFor != nullptr)
        this->setProgress(m_proxyFor->progress());
}

qreal ProgressReport::progressStep() const
{
    return m_progressStep;
}

void ProgressReport::setProgressStep(qreal val)
{
    if(qFuzzyCompare(m_progressStep,val))
        return;

    m_progressStep = val;
}

void ProgressReport::setProgressStepFromCount(int count)
{
    this->setProgressStep(1.0/qreal(count));
}

void ProgressReport::tick()
{
    if(m_progressStep > 0)
        this->setProgress(m_progress+m_progressStep);
}

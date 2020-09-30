/****************************************************************************
**
** Copyright (C) TERIFLIX Entertainment Spaces Pvt. Ltd. Bengaluru
** Author: Prashanth N Udupa (prashanth.udupa@teriflix.com)
**
** This code is distributed under GPL v3. Complete text of the license
** can be found here: https://www.gnu.org/licenses/gpl-3.0.txt
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/

#ifndef CHARACTERRELATIONSHIPSGRAPH_H
#define CHARACTERRELATIONSHIPSGRAPH_H

#include <QObject>

#include "structure.h"
#include "qobjectproperty.h"
#include "objectlistpropertymodel.h"

class CharacterRelationshipsGraph;

class CharacterRelationshipsGraphNode : public QObject
{
    Q_OBJECT

public:
    ~CharacterRelationshipsGraphNode();

    Q_PROPERTY(Character* character READ character NOTIFY characterChanged RESET resetCharacter)
    Character* character() const { return m_character; }
    Q_SIGNAL void characterChanged();

    Q_PROPERTY(QRectF rect READ rect NOTIFY rectChanged)
    QRectF rect() const { return m_rect; }
    Q_SIGNAL void rectChanged();

    bool isPlaced() const { return !m_rect.isNull(); }

protected:
    friend class CharacterRelationshipsGraph;
    CharacterRelationshipsGraphNode(QObject *parent=nullptr);
    void setCharacter(Character* val);
    void resetCharacter();
    void setRect(const QRectF &val);

private:
    QRectF m_rect;
    QObjectProperty<Character> m_character;
};

class CharacterRelationshipsGraphEdge : public QObject
{
    Q_OBJECT

public:
    ~CharacterRelationshipsGraphEdge();

    Q_PROPERTY(Relationship* relationship READ relationship NOTIFY relationshipChanged RESET resetRelationship)
    Relationship* relationship() const { return m_relationship; }
    Q_SIGNAL void relationshipChanged();

    Q_PROPERTY(QPainterPath path READ path NOTIFY pathChanged)
    QPainterPath path() const { return m_path; }
    Q_SIGNAL void pathChanged();

protected:
    friend class CharacterRelationshipsGraph;
    CharacterRelationshipsGraphEdge(QObject *parent=nullptr);
    void setRelationship(Relationship* val);
    void resetRelationship();
    void setPath(const QPainterPath &val);

private:
    QPainterPath m_path;
    QObjectProperty<Relationship> m_relationship;
};

class CharacterRelationshipsGraph : public QObject
{
    Q_OBJECT

public:
    CharacterRelationshipsGraph(QObject *parent = nullptr);
    ~CharacterRelationshipsGraph();

    Q_PROPERTY(QAbstractListModel* nodes READ nodes CONSTANT)
    QAbstractListModel *nodes() const {
        return &((const_cast<CharacterRelationshipsGraph*>(this))->m_nodes);
    }

    Q_PROPERTY(QAbstractListModel* edges READ edges CONSTANT)
    QAbstractListModel *edges() const {
        return &(const_cast<CharacterRelationshipsGraph*>(this))->m_edges;
    }

    Q_PROPERTY(QSizeF nodeSize READ nodeSize WRITE setNodeSize NOTIFY nodeSizeChanged)
    void setNodeSize(const QSizeF &val);
    QSizeF nodeSize() const { return m_nodeSize; }
    Q_SIGNAL void nodeSizeChanged();

    Q_PROPERTY(Structure* structure READ structure WRITE setStructure NOTIFY structureChanged RESET resetStructure)
    void setStructure(Structure* val);
    Structure* structure() const { return m_structure; }
    Q_SIGNAL void structureChanged();

    Q_PROPERTY(QStringList filterByCharacterNames READ filterByCharacterNames WRITE setFilterByCharacterNames NOTIFY filterByCharacterNamesChanged)
    void setFilterByCharacterNames(const QStringList &val);
    QStringList filterByCharacterNames() const { return m_filterByCharacterNames; }
    Q_SIGNAL void filterByCharacterNamesChanged();

    Q_PROPERTY(int maxTime READ maxTime WRITE setMaxTime NOTIFY maxTimeChanged)
    void setMaxTime(int val);
    int maxTime() const { return m_maxTime; }
    Q_SIGNAL void maxTimeChanged();

    Q_INVOKABLE void reload();

private:
    void resetStructure();
    void load();

private:
    int m_maxTime = 1000;
    QSizeF m_nodeSize;
    QStringList m_filterByCharacterNames;
    QObjectProperty<Structure> m_structure;
    ObjectListPropertyModel<CharacterRelationshipsGraphNode*> m_nodes;
    ObjectListPropertyModel<CharacterRelationshipsGraphEdge*> m_edges;
};

#endif // CHARACTERRELATIONSHIPSGRAPH_H

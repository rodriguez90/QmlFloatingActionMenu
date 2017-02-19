#pragma once

#include "fam/floatingactionbutton.hpp"
#include "fam/floatingactionmenu.hpp"
#include "fam/qqmlobjectlistmodel.hpp"
#include <QDebug>


class FloatingActions : public QObject
{
Q_OBJECT

signals:

public slots:
    virtual void onButtonSelected(const QString&  contextId,int modelIndex){
        Q_UNUSED(contextId);
        Q_UNUSED(modelIndex);
    }

    virtual void onMenuSelected(const QString&  contextId, bool isClosed){
        Q_UNUSED(contextId);
        Q_UNUSED(isClosed);
    }

public:
    explicit FloatingActions(QObject *parent = nullptr);

    FloatingActions( const QString& menuProperyName, const QString& buttonsProperyName,QQmlContext *context, QObject *parent = nullptr);

//    virtual ~FloatingActions ( )
//    {
//        qDebug() << "~FloatingActions called";
//    }

    static void initialize(QQmlContext *context, QObject *parent)
    {
        FloatingActions* floatingActions = new FloatingActions {parent};
        floatingActions->initializeContext(context);
        qmlRegisterType<FloatingActionMenu>("FloatingActionMenu",1,0,"FloatingActionMenu");
    }

    virtual void initialize(QObject *parent) {
        Q_UNUSED(parent);
    }

    template<typename T>
    static T* createInstance (const QString& menuProperyName, const QString& buttonsProperyName, QQmlContext *context, QObject * parent ) {
        T* t = new T { menuProperyName, buttonsProperyName,context,parent};
        t->initialize(parent);
        return t;
    }

    virtual FloatingActionMenu* menu() {
        return mFloatingActionMenu;
    }

    virtual QQmlObjectListModel<FloatingActionButton>* buttons() {
        return &mFloatingActionButtons;
    }

protected:
    void initializeContext ( QQmlContext *context);
    FloatingActionMenu* mFloatingActionMenu;
    QQmlObjectListModel<FloatingActionButton> mFloatingActionButtons;
    const QString mMenuProperyName;
    const QString mButtonsProperyName;

private:



};


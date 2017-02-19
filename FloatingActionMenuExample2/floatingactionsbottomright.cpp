#include "floatingactionsbottomright.hpp"


FloatingActionsBottomRight::FloatingActionsBottomRight(const QString& menuProperyName, const QString& buttonsProperyName, QQmlContext *context, QObject *parent) :
    FloatingActions{menuProperyName,buttonsProperyName,context, parent}{
}

void FloatingActionsBottomRight::onButtonSelected(const QString& contextId,int modelIndex)
{
    if( contextId == mButtonsProperyName)
        qDebug() << "FloatingActionsBottomRight buttonSelected:  modelIndex=" << modelIndex << "contextId: " << contextId;
}

void FloatingActionsBottomRight::onMenuSelected(const QString& contextId,bool isClosed)
{
    if( contextId == mMenuProperyName)
        qDebug() << "FloatingActionsBottomRight menuSelected:  isClosed=" << isClosed << "contextId: " << contextId <<"  mButtonsProperyName:" <<mButtonsProperyName;
}


void FloatingActionsBottomRight::initialize(QObject *parent)
{
    mFloatingActionMenu->setLabelBackColor("LAVENDER");
    mFloatingActionMenu->setIconColor("slategrey");

    mFloatingActionButtons.append( new FloatingActionButton {parent, "","qrc:/image/edit.png", "blue"});
    mFloatingActionButtons.append( new FloatingActionButton {parent, tr("Add New"),"qrc:/image/add.png", "green"});
    mFloatingActionButtons.append( new FloatingActionButton {parent, tr("Delete Current"),"qrc:/image/delete.png", "red"});
}

void FloatingActionsBottomRight::assignSlots(QObject* rootObject)
{
    QObject::connect (rootObject, SIGNAL(menuSelected(QString,bool)),this, SLOT(onMenuSelected(QString,bool)));
    QObject::connect (rootObject, SIGNAL(buttonSelected(QString,int)),this, SLOT(onButtonSelected(QString,int)));
}

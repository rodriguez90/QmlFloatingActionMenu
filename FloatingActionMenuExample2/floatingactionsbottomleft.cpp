#include "floatingactionsbottomleft.hpp"


FloatingActionsBottomLeft::FloatingActionsBottomLeft( const QString& menuProperyName, const QString& buttonsProperyName, QQmlContext *context,QObject *parent) :
    FloatingActions{menuProperyName,buttonsProperyName,context,  parent}{
}

void FloatingActionsBottomLeft::onButtonSelected(const QString&  contextId,int modelIndex)
{
    if( contextId == mButtonsProperyName)
        qDebug() << "FloatingActionsBottomLeft buttonSelected:  modelIndex=" << modelIndex << "contextId: " << contextId;
}

void FloatingActionsBottomLeft::onMenuSelected(const QString&  contextId,bool isClosed)
{
    if( contextId == mMenuProperyName)
        qDebug() << "FloatingActionsBottomLeft menuSelected:  isClosed=" << isClosed << "contextId: " << contextId;
}

void FloatingActionsBottomLeft::initialize(QObject *parent)
{
    mFloatingActionMenu->setIconUrl("qrc:/image/cloud.png");
    mFloatingActionMenu->setIconColor("skyblue");
    mFloatingActionMenu->setButtonWidth(80);
    mFloatingActionMenu->setIsLabelBeforeButton(false);

    mFloatingActionButtons.append( new FloatingActionButton {parent, tr("Download"),"qrc:/image/clouddownload.png", "skyblue"});
    mFloatingActionButtons.append( new FloatingActionButton {parent, tr("Upload"),"qrc:/image/cloudupload.png", "skyblue"});
}

void FloatingActionsBottomLeft::assignSlots(QObject* rootObject)
{
    QObject::connect (rootObject, SIGNAL(menuSelected(QString,bool)),this, SLOT(onMenuSelected(QString,bool)));
    QObject::connect (rootObject, SIGNAL(buttonSelected(QString,int)),this, SLOT(onButtonSelected(QString,int)));
}

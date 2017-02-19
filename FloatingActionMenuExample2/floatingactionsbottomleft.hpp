#pragma once

#include "fam/floatingactions.hpp"
#include <QDebug>


class FloatingActionsBottomLeft : public FloatingActions
{

public slots:
    void onButtonSelected(const QString&  contextId,int modelIndex) override final;
    void onMenuSelected(const QString&  contextId,bool isClosed) override final;

public:
    FloatingActionsBottomLeft(const QString& menuProperyName, const QString& buttonsProperyName,QQmlContext *context,  QObject *parent = nullptr);
    void initialize(QObject *parent)  override final;
    void assignSlots(QObject* rootObject);

//    ~FloatingActionsBottomLeft()
//    {
//        qDebug() << " ~FloatingActionsBottomLeft() called";
//    }

private:


};


#pragma once

#include <QObject>
#include <QString>
#include <QtQml>

class FloatingActionButton : public QObject
{
Q_OBJECT
Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
Q_PROPERTY(QString iconUrl READ iconUrl WRITE setIconUrl NOTIFY iconUrlChanged)
Q_PROPERTY(QString iconColor READ iconColor WRITE setIconColor NOTIFY iconColorChanged )

signals:
    void descriptionChanged(const QString&  description);
    void iconUrlChanged(const QString&  iconUrl);
    void iconColorChanged(const QString&  iconColor);

public:
    explicit FloatingActionButton(QObject *parent = nullptr) : QObject(parent)
    {
    }

    FloatingActionButton(QObject *parent, const QString& description, const QString&  iconUrl, const QString&  iconColor) :
        QObject(parent){
        m_description = description;
        m_iconUrl = iconUrl;
        m_iconColor= iconColor;
    }

//    ~FloatingActionButton()
//    {
//        qDebug() << " ~FloatingActionButton() called";
//    }

    const QString&  description() const
    {
        return m_description;
    }
    const QString&  iconUrl() const
    {
        return m_iconUrl;
    }
    const QString&  iconColor() const
    {
        return m_iconColor;
    }

public slots:
    void setDescription(const QString&  description)
    {
        if (m_description == description)
            return;

        m_description = description;
        emit descriptionChanged(description);
    }

    void setIconUrl(const QString&  iconUrl)
    {
        if (m_iconUrl == iconUrl)
            return;

        m_iconUrl = iconUrl;
        emit iconUrlChanged(iconUrl);
    }

    void setIconColor(const QString&  iconColor)
    {
        if (m_iconColor == iconColor)
            return;

        m_iconColor = iconColor;
        emit iconColorChanged(iconColor);
    }

private:
    QString m_description;
    QString m_iconUrl;
    QString m_iconColor;

};


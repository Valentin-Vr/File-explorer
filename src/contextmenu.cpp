#include "contextmenu.h"
#include <QFile>
#include <QDebug>

ContextMenu::ContextMenu(QObject *parent) : QObject(parent)
{

}

void ContextMenu::removeFile(const QString &path)
{
    if(!QFile::remove(path))
        qDebug() << "File not found";
}

void ContextMenu::renameFile(const QString &path, const QString &newName)
{
    if(!QFile::rename(path, newName))
        qDebug() << "File not found";
}

void ContextMenu::setPath(QString path)
{
    if (m_path == path)
        return;

    m_path = path;
    emit pathChanged(m_path);
}

QString ContextMenu::path() const
{
    return m_path;
}

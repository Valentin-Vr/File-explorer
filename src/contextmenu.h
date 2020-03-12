#ifndef CONTEXTMENU_H
#define CONTEXTMENU_H

#include <QObject>

class ContextMenu : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
public:
    explicit ContextMenu(QObject *parent = nullptr);

    Q_INVOKABLE void removeFile(const QString &path);
    Q_INVOKABLE void renameFile(const QString &path, const QString &newName);

    QString path() const;

public slots:
    void setPath(QString path);
signals:
    void pathChanged(QString path);
private:
    QString m_path;
};

#endif // CONTEXTMENU_H

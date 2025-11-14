#!/bin/bash

# 🚀 GitHub Pages Deploy Script
# Автоматизирует деплой вашего сайта на GitHub Pages

set -e  # Выход при ошибке

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🚀 GitHub Pages Deploy Script                             ║"
echo "║  Автоматический деплой сайта на GitHub Pages              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Проверка git
if ! command -v git &> /dev/null; then
    echo "❌ Git не установлен. Пожалуйста установите git."
    exit 1
fi

echo "📍 Текущая директория: $(pwd)"
echo ""

# Проверка, что это git репозиторий
if [ ! -d ".git" ]; then
    echo "❌ Это не git репозиторий!"
    echo "   Инициализируйте репозиторий:"
    echo "   git init"
    exit 1
fi

echo "✅ Git репозиторий найден"
echo ""

# Показываем текущий статус
echo "📊 Статус репозитория:"
git status
echo ""

# Проверка наличия изменений
if git diff --quiet && git diff --cached --quiet; then
    echo "ℹ️  Нет новых изменений для коммита"
else
    echo "📝 Найдены изменения. Добавляю файлы..."
    git add .
    
    # Запрашиваем сообщение коммита
    read -p "📌 Введите сообщение коммита (по умолчанию 'Update site'): " commit_msg
    commit_msg=${commit_msg:-"Update site"}
    
    echo "💾 Коммитю: '$commit_msg'"
    git commit -m "$commit_msg"
fi

echo ""
echo "🚀 Загружаю на GitHub (push)..."
git push origin main

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ✅ Деплой успешен!                                        ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo "🔍 Проверьте деплой статус:"
echo "   1. GitHub Actions: https://github.com/diasaliyev21-sudo/my-site/actions"
echo "   2. Ваш сайт: https://diasaliyev21-sudo.github.io"
echo ""

echo "⏱️  Деплой займет 1-2 минуты..."
echo "🎉 После завершения ваш сайт будет обновлен!"

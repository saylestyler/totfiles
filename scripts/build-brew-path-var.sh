# Build PATH variable script in ~/.brew_path
for i in /usr/local/Cellar/*/*/bin; do
  echo 'export PATH="'$i':$PATH"' >> ~/.brew_path
done
for i in /usr/local/Cellar/*/*/libexec/gnubin; do
  echo 'export PATH="'$i':$PATH"' >> ~/.brew_path
done
for i in /usr/local/Cellar/*/*/share/man; do
  echo 'export MANPATH="'$i':$MANPATH"' >> ~/.brew_path
done
for i in /usr/local/Cellar/*/*/libexec/gnuman; do
  echo 'export MANPATH="'$i':$MANPATH"' >> ~/.brew_path
done

echo "source ~/.brew_path" >> ~/.bash_profile
echo "source ~/.brew_path" >> ~/.zshrc
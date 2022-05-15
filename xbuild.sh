day=$(date +%F)
# echo -n 22.03_b$day >release.tag && \
# sed -i "s/name: Build x-wrt.*/name: Build x-wrt-$day/g" .github/workflows/build-xwrt.yml && \
# sed -i "s/22.03_b.*/22.03_b$day\"/" .configx && \
git add . && \
git commit -m "release: $day" && \
git push origin master || exit 1

curl https://graphql.buildkite.com/v1 \
  -d '{"query":"query { build(slug: \"sumatestorg/artifact-test/136\") { jobs(first: 500, step: { key: \"knapsack\" }) { edges { node { ... on JobTypeCommand { artifacts(first: 500) { edges { node { downloadURL path uuid } } } } } } } }}"}'

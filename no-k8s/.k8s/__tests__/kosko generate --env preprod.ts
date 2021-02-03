//

import { getEnvManifests } from "@socialgouv/kosko-charts/testing"
import { project } from "@socialgouv/kosko-charts/testing/fake/gitlab-ci.env"

import { name } from "../../.socialgouv/config.json"

jest.setTimeout(1000 * 60)
test("kosko generate --preprod", async () => {
  expect(
    await getEnvManifests("preprod", "", project(name).preprod)
  ).toMatchSnapshot()
})

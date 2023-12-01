"""All the process that can be run using nox.

The nox run are build in isolated environment that will be stored in .nox. to force the venv update, remove the .nox/xxx folder.
"""
import nox

nox.options.sessions = ["docs"]


@nox.session(name="docs", reuse_venv=True)
def docs(session):
    """Build the documentation."""
    session.install("-r", "requirements.txt")
    session.run("rm", "-rf", "docs/source/modules", external=True)
    session.run("rm", "-rf", "docs/build/html", external=True)

    session.run(
        "sphinx-build",
        "-b",
        "html",
        "docs/source",
        "docs/build/html",
        "-w",
        "warnings.txt",
    )

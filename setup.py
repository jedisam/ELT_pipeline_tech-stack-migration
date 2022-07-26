#!/usr/bin/env python
"""Setup script for the py-pip-install-test package."""

from setuptools import setup, find_packages

with open("README.md") as readme_file:
    readme = readme_file.read()

requirements = ["pytest==7.1.1"]

test_requirements = [
    "pandas",
    "matplotlib",
    "MYSQL",
    "Suoerset",
    "pytest>=3",
]

setup(
    author="Yididiya",
    email="yidisam18@gmail.com",
    python_requires=">=3.6",
    description="Migration of scalable data warehouse ELT implmentation",
    install_requires=requirements,
    long_description=readme,
    include_package_data=True,
    keywords="dwh, migrations, unit_testing, pytest",
    name="Scalable_DWH_Migration",
    packages=find_packages(include=["src", "src.*"]),
    test_suite="Tests",
    tests_require=test_requirements,
    url="https://github.com/jedisam/ELT_pipeline_tech-stack-migration",
    version="0.1.0",
    zip_safe=False,
)

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE keycloak OWNER TO keycloak;

\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
427e19d6-08dd-47ee-83ff-57b3d6e73648	\N	auth-cookie	a03a5306-1fa8-4e80-a095-103e9f150252	7174faff-f0d8-45d1-bbfe-1006dfadf9b9	2	10	f	\N	\N
96336167-78b5-4b3e-b6d9-f914df2537c9	\N	auth-spnego	a03a5306-1fa8-4e80-a095-103e9f150252	7174faff-f0d8-45d1-bbfe-1006dfadf9b9	3	20	f	\N	\N
4246c6d0-1247-4e7c-b171-b09166fd8c8a	\N	identity-provider-redirector	a03a5306-1fa8-4e80-a095-103e9f150252	7174faff-f0d8-45d1-bbfe-1006dfadf9b9	2	25	f	\N	\N
794bdeea-f227-4090-844e-e6f079236068	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	7174faff-f0d8-45d1-bbfe-1006dfadf9b9	2	30	t	2a0ebd97-840f-4ed5-b3ad-5c3ee7f0dca8	\N
019f6ab0-96a5-4250-84cc-68c66ec9e001	\N	auth-username-password-form	a03a5306-1fa8-4e80-a095-103e9f150252	2a0ebd97-840f-4ed5-b3ad-5c3ee7f0dca8	0	10	f	\N	\N
b797a728-132f-4649-8177-2f8b243f1cb2	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	2a0ebd97-840f-4ed5-b3ad-5c3ee7f0dca8	1	20	t	918b26ec-a8a3-4d48-a497-73b852a9df0d	\N
c59f775e-645f-4f20-82af-45fe58275073	\N	conditional-user-configured	a03a5306-1fa8-4e80-a095-103e9f150252	918b26ec-a8a3-4d48-a497-73b852a9df0d	0	10	f	\N	\N
1766ae7e-0783-4ba5-9f47-2046731ed2e3	\N	auth-otp-form	a03a5306-1fa8-4e80-a095-103e9f150252	918b26ec-a8a3-4d48-a497-73b852a9df0d	0	20	f	\N	\N
8201d29f-65e1-417c-9157-48d03ec0dc8a	\N	direct-grant-validate-username	a03a5306-1fa8-4e80-a095-103e9f150252	46ce77d8-5b4a-44ff-8ad1-9a39f2a70f49	0	10	f	\N	\N
2d8db57b-cc26-4b3b-ad3d-6887cca70fdc	\N	direct-grant-validate-password	a03a5306-1fa8-4e80-a095-103e9f150252	46ce77d8-5b4a-44ff-8ad1-9a39f2a70f49	0	20	f	\N	\N
b7ef4646-94f3-48f1-81c1-528214ff49bd	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	46ce77d8-5b4a-44ff-8ad1-9a39f2a70f49	1	30	t	b55675f4-d6e1-4d89-b8a5-5e859aa5a95f	\N
67e2fd64-3a50-4e08-9fe7-e1a3feb35e38	\N	conditional-user-configured	a03a5306-1fa8-4e80-a095-103e9f150252	b55675f4-d6e1-4d89-b8a5-5e859aa5a95f	0	10	f	\N	\N
cde3095b-fdb9-4bd1-94b3-9aa448f18325	\N	direct-grant-validate-otp	a03a5306-1fa8-4e80-a095-103e9f150252	b55675f4-d6e1-4d89-b8a5-5e859aa5a95f	0	20	f	\N	\N
9270b459-6671-4c09-aed8-a0b24890afa6	\N	registration-page-form	a03a5306-1fa8-4e80-a095-103e9f150252	82b1302a-e904-4266-86fc-7130a89ba62d	0	10	t	ac7a1069-7c03-4f69-bdcd-8784ebe4f993	\N
d467c388-0065-4eb5-bf15-6380e59c7328	\N	registration-user-creation	a03a5306-1fa8-4e80-a095-103e9f150252	ac7a1069-7c03-4f69-bdcd-8784ebe4f993	0	20	f	\N	\N
5a495aa7-5741-4a21-8f01-f817b7a3c2f7	\N	registration-password-action	a03a5306-1fa8-4e80-a095-103e9f150252	ac7a1069-7c03-4f69-bdcd-8784ebe4f993	0	50	f	\N	\N
ca21bd69-4f99-4843-bb23-e68b12f7d549	\N	registration-recaptcha-action	a03a5306-1fa8-4e80-a095-103e9f150252	ac7a1069-7c03-4f69-bdcd-8784ebe4f993	3	60	f	\N	\N
30b0981e-59da-424d-a056-77ac1b764cc6	\N	registration-terms-and-conditions	a03a5306-1fa8-4e80-a095-103e9f150252	ac7a1069-7c03-4f69-bdcd-8784ebe4f993	3	70	f	\N	\N
140f11e7-a923-4b84-83ad-f400483726da	\N	reset-credentials-choose-user	a03a5306-1fa8-4e80-a095-103e9f150252	daf4aaa6-2ae3-4277-8b45-e1d4a7481812	0	10	f	\N	\N
fc3f32f4-4d5a-4469-ba5d-ed349d9f1dfe	\N	reset-credential-email	a03a5306-1fa8-4e80-a095-103e9f150252	daf4aaa6-2ae3-4277-8b45-e1d4a7481812	0	20	f	\N	\N
86d9e544-3a93-4f2b-9a3c-a2f94e75b237	\N	reset-password	a03a5306-1fa8-4e80-a095-103e9f150252	daf4aaa6-2ae3-4277-8b45-e1d4a7481812	0	30	f	\N	\N
bd6fa45c-c595-45a7-a167-d714910af53c	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	daf4aaa6-2ae3-4277-8b45-e1d4a7481812	1	40	t	753ad7f5-b763-4d00-8fb0-025c69780ff9	\N
1d0ee7bf-ce5b-4ed5-9825-f7eebb88cdd7	\N	conditional-user-configured	a03a5306-1fa8-4e80-a095-103e9f150252	753ad7f5-b763-4d00-8fb0-025c69780ff9	0	10	f	\N	\N
e93d7efc-7095-4aa2-912f-f6cfd7046fd0	\N	reset-otp	a03a5306-1fa8-4e80-a095-103e9f150252	753ad7f5-b763-4d00-8fb0-025c69780ff9	0	20	f	\N	\N
2500b7e0-431d-4a2c-b28b-49cb0584d3ad	\N	client-secret	a03a5306-1fa8-4e80-a095-103e9f150252	f5709df3-9eec-4eee-9873-2b0726ba991f	2	10	f	\N	\N
8c26eca9-a40b-4198-bd8c-a349bbf97175	\N	client-jwt	a03a5306-1fa8-4e80-a095-103e9f150252	f5709df3-9eec-4eee-9873-2b0726ba991f	2	20	f	\N	\N
29f022f6-98b5-45de-88be-17de9432b26b	\N	client-secret-jwt	a03a5306-1fa8-4e80-a095-103e9f150252	f5709df3-9eec-4eee-9873-2b0726ba991f	2	30	f	\N	\N
f7b61f66-7343-4994-96bf-876a69c5b3f4	\N	client-x509	a03a5306-1fa8-4e80-a095-103e9f150252	f5709df3-9eec-4eee-9873-2b0726ba991f	2	40	f	\N	\N
ec6f316f-7eab-4ac3-8e2c-f052f3e05448	\N	idp-review-profile	a03a5306-1fa8-4e80-a095-103e9f150252	3ce1064a-3925-4dea-8fb1-4021c4461ec9	0	10	f	\N	d8418a1f-9844-4838-8a7b-f6e763d10bce
e2b8616c-dbbf-417e-bef5-5cdab75584d2	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	3ce1064a-3925-4dea-8fb1-4021c4461ec9	0	20	t	7bf65578-e11b-45f1-a906-27152974e02a	\N
e34e3c75-47da-496c-ade4-ee206575b82b	\N	idp-create-user-if-unique	a03a5306-1fa8-4e80-a095-103e9f150252	7bf65578-e11b-45f1-a906-27152974e02a	2	10	f	\N	89a661cb-6f2d-4a9a-8198-776fe61771f3
645c5e8c-a43b-458e-9d67-4ea62c115d49	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	7bf65578-e11b-45f1-a906-27152974e02a	2	20	t	655221c4-930a-4c0c-bf13-ca53df4873d3	\N
755fb6bb-5e8b-4692-a2f2-bc12e642b8c5	\N	idp-confirm-link	a03a5306-1fa8-4e80-a095-103e9f150252	655221c4-930a-4c0c-bf13-ca53df4873d3	0	10	f	\N	\N
f461f1b4-8327-49c2-88fb-e01d010d6b31	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	655221c4-930a-4c0c-bf13-ca53df4873d3	0	20	t	e2f00ad3-2a08-49c9-b164-5987fe8ab507	\N
ebb16d84-a6ff-45a9-9cd2-ed749881a426	\N	idp-email-verification	a03a5306-1fa8-4e80-a095-103e9f150252	e2f00ad3-2a08-49c9-b164-5987fe8ab507	2	10	f	\N	\N
f532151b-cee6-49d0-a7cd-89292d176b30	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	e2f00ad3-2a08-49c9-b164-5987fe8ab507	2	20	t	56238f77-a314-401a-9de4-dbe977fe6383	\N
5b4a8dd7-a760-401b-8467-5f46ef8fd7ba	\N	idp-username-password-form	a03a5306-1fa8-4e80-a095-103e9f150252	56238f77-a314-401a-9de4-dbe977fe6383	0	10	f	\N	\N
c21afe91-f62e-4460-aa22-7b8b41904845	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	56238f77-a314-401a-9de4-dbe977fe6383	1	20	t	8fa664dc-6cd1-423d-88ab-206f099522ae	\N
79084980-3751-4a61-a010-a58eec18b799	\N	conditional-user-configured	a03a5306-1fa8-4e80-a095-103e9f150252	8fa664dc-6cd1-423d-88ab-206f099522ae	0	10	f	\N	\N
a54c1c00-56e8-4ee7-b059-0cd04146291b	\N	auth-otp-form	a03a5306-1fa8-4e80-a095-103e9f150252	8fa664dc-6cd1-423d-88ab-206f099522ae	0	20	f	\N	\N
5bc69d97-094d-4f50-8c36-cff1c5a8d621	\N	http-basic-authenticator	a03a5306-1fa8-4e80-a095-103e9f150252	3f9c9e38-57ea-4133-b8a2-6b4c9535bb33	0	10	f	\N	\N
76ffa61a-5219-4cfe-a423-5601f7a60afc	\N	docker-http-basic-authenticator	a03a5306-1fa8-4e80-a095-103e9f150252	fae4ec2b-2a71-49b8-a9b6-04550c1adc9f	0	10	f	\N	\N
a6d29fd0-2eac-4c2d-ba31-76ed43626a56	\N	auth-cookie	2b2b321a-629d-48cd-a065-806aca97437e	87de095b-67d4-4669-91f6-8d81cac3a26f	2	10	f	\N	\N
d67da57d-7f96-415c-99f5-804546e63d6a	\N	auth-spnego	2b2b321a-629d-48cd-a065-806aca97437e	87de095b-67d4-4669-91f6-8d81cac3a26f	3	20	f	\N	\N
b62554f7-2283-4755-ba6d-601c6af2c380	\N	identity-provider-redirector	2b2b321a-629d-48cd-a065-806aca97437e	87de095b-67d4-4669-91f6-8d81cac3a26f	2	25	f	\N	\N
97a2538c-72b7-4636-8cb3-f46958fbd595	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	87de095b-67d4-4669-91f6-8d81cac3a26f	2	30	t	751b4f2c-eaab-41ba-945d-c6e2bb885ee2	\N
2474aa52-7d11-4464-bf28-638fa6257c48	\N	auth-username-password-form	2b2b321a-629d-48cd-a065-806aca97437e	751b4f2c-eaab-41ba-945d-c6e2bb885ee2	0	10	f	\N	\N
0800ca98-2014-4e1e-9112-5399bc2b802c	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	751b4f2c-eaab-41ba-945d-c6e2bb885ee2	1	20	t	3338b88a-2322-4407-89bb-04012d0dc572	\N
25b8b0ca-ebdf-43f6-bd89-2a87944dc2d9	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	3338b88a-2322-4407-89bb-04012d0dc572	0	10	f	\N	\N
e982895d-ac7b-4102-a3f7-dd9aae521d7f	\N	auth-otp-form	2b2b321a-629d-48cd-a065-806aca97437e	3338b88a-2322-4407-89bb-04012d0dc572	0	20	f	\N	\N
623b61e2-fd63-4438-bbdd-65022ff527a0	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	87de095b-67d4-4669-91f6-8d81cac3a26f	2	26	t	e0ad8a1d-7689-4e59-a0f4-6a721159ffac	\N
ec1351dd-2bfa-4e68-8109-ba4a6beb8809	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	e0ad8a1d-7689-4e59-a0f4-6a721159ffac	1	10	t	3dd32315-5392-4619-a27d-0f6ed3605e91	\N
62f0bacc-ba04-4d6b-8150-0059cce9e57b	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	3dd32315-5392-4619-a27d-0f6ed3605e91	0	10	f	\N	\N
8ef30402-9269-46da-aea9-3d6295989cd6	\N	organization	2b2b321a-629d-48cd-a065-806aca97437e	3dd32315-5392-4619-a27d-0f6ed3605e91	2	20	f	\N	\N
3b4d624f-d982-4040-a9b1-f40a11cea8c6	\N	direct-grant-validate-username	2b2b321a-629d-48cd-a065-806aca97437e	56f10eb0-69ee-4eb8-a783-50db29cd5000	0	10	f	\N	\N
366f71d7-c587-4f9c-865c-d34a372c39f9	\N	direct-grant-validate-password	2b2b321a-629d-48cd-a065-806aca97437e	56f10eb0-69ee-4eb8-a783-50db29cd5000	0	20	f	\N	\N
a6a776da-f407-43b0-a480-5df30c22aa69	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	56f10eb0-69ee-4eb8-a783-50db29cd5000	1	30	t	82f007ea-3bea-401c-9e05-e86d4fa8ef2f	\N
90c41a8a-2c7b-4097-bd04-7f560c514143	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	82f007ea-3bea-401c-9e05-e86d4fa8ef2f	0	10	f	\N	\N
18dccacc-b9d0-4581-9b95-fd5e5ba2cf63	\N	direct-grant-validate-otp	2b2b321a-629d-48cd-a065-806aca97437e	82f007ea-3bea-401c-9e05-e86d4fa8ef2f	0	20	f	\N	\N
59f05eef-e22a-4570-b8fd-f324deed277f	\N	registration-page-form	2b2b321a-629d-48cd-a065-806aca97437e	f82c8f01-5e2e-46dd-8c06-9b03280c0103	0	10	t	dc22d90b-a8f0-4b95-b993-60d201dda9a2	\N
b515d5c6-18d7-4fb7-890c-1d215ceb2ec2	\N	registration-user-creation	2b2b321a-629d-48cd-a065-806aca97437e	dc22d90b-a8f0-4b95-b993-60d201dda9a2	0	20	f	\N	\N
f7042710-9636-4b73-b043-ea045937bb55	\N	registration-password-action	2b2b321a-629d-48cd-a065-806aca97437e	dc22d90b-a8f0-4b95-b993-60d201dda9a2	0	50	f	\N	\N
126f3a3c-8fd7-4ce8-8033-29c81e7f2319	\N	registration-recaptcha-action	2b2b321a-629d-48cd-a065-806aca97437e	dc22d90b-a8f0-4b95-b993-60d201dda9a2	3	60	f	\N	\N
775deb58-65cf-45cc-9a33-9ad5d7541962	\N	registration-terms-and-conditions	2b2b321a-629d-48cd-a065-806aca97437e	dc22d90b-a8f0-4b95-b993-60d201dda9a2	3	70	f	\N	\N
da8cbe95-3a1a-42a2-9db4-140738e235c6	\N	reset-credentials-choose-user	2b2b321a-629d-48cd-a065-806aca97437e	4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	0	10	f	\N	\N
387f006e-7b77-4bd5-a8bc-03272fa541e4	\N	reset-credential-email	2b2b321a-629d-48cd-a065-806aca97437e	4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	0	20	f	\N	\N
c93c3e5b-8764-4ea2-a5d2-21ef5e159306	\N	reset-password	2b2b321a-629d-48cd-a065-806aca97437e	4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	0	30	f	\N	\N
cc5d44d8-2c53-48f8-960a-2b6dcdcef7cf	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	1	40	t	b54e7b79-3a9b-4222-94f0-e3495c3e1d23	\N
3e53a90a-c336-40af-af7d-3b5db31422a0	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	b54e7b79-3a9b-4222-94f0-e3495c3e1d23	0	10	f	\N	\N
29cde292-620e-4001-8ea9-20678ef52150	\N	reset-otp	2b2b321a-629d-48cd-a065-806aca97437e	b54e7b79-3a9b-4222-94f0-e3495c3e1d23	0	20	f	\N	\N
82ff5e82-ea94-449f-bb26-153e937e3ca5	\N	client-secret	2b2b321a-629d-48cd-a065-806aca97437e	500a092f-1606-4ba2-b90b-426cca2135e6	2	10	f	\N	\N
06b10f7e-935f-409c-a9d2-0c654a63f814	\N	client-jwt	2b2b321a-629d-48cd-a065-806aca97437e	500a092f-1606-4ba2-b90b-426cca2135e6	2	20	f	\N	\N
c433e563-4e37-428c-837d-cf54aa715491	\N	client-secret-jwt	2b2b321a-629d-48cd-a065-806aca97437e	500a092f-1606-4ba2-b90b-426cca2135e6	2	30	f	\N	\N
52aab3c8-83f2-41a2-af8c-9669d93bc466	\N	client-x509	2b2b321a-629d-48cd-a065-806aca97437e	500a092f-1606-4ba2-b90b-426cca2135e6	2	40	f	\N	\N
684194fa-7f4f-4cae-b2aa-740da5a1689d	\N	idp-review-profile	2b2b321a-629d-48cd-a065-806aca97437e	e93fd7c4-2626-4d5d-9f59-ca55658161ac	0	10	f	\N	2af53d60-0045-4296-adc2-d62b6fe61a85
e5b2ff76-73f3-4ae3-93b5-381875f79ce8	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	e93fd7c4-2626-4d5d-9f59-ca55658161ac	0	20	t	2ee02093-2546-4a56-8366-9f35ca500436	\N
1bb2551a-9180-4717-baed-289890b9d786	\N	idp-create-user-if-unique	2b2b321a-629d-48cd-a065-806aca97437e	2ee02093-2546-4a56-8366-9f35ca500436	2	10	f	\N	82c6f379-4df0-48ca-aa71-a042a0fdc55d
b2486b1b-614e-4ab7-abcf-59e1187b1042	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	2ee02093-2546-4a56-8366-9f35ca500436	2	20	t	7d9324cc-3437-42ca-800d-bcbb4776db94	\N
8721f734-c184-4a20-9168-7e711ce30048	\N	idp-confirm-link	2b2b321a-629d-48cd-a065-806aca97437e	7d9324cc-3437-42ca-800d-bcbb4776db94	0	10	f	\N	\N
0fa720bd-49ac-4cf4-bb55-945408099e0d	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	7d9324cc-3437-42ca-800d-bcbb4776db94	0	20	t	382442a4-81a5-4784-ae43-df06bc3e8eb8	\N
7817fa7e-ad16-4f98-a32f-3954b302798d	\N	idp-email-verification	2b2b321a-629d-48cd-a065-806aca97437e	382442a4-81a5-4784-ae43-df06bc3e8eb8	2	10	f	\N	\N
dc1c35d3-6797-4be4-bf76-a1377c5fce5f	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	382442a4-81a5-4784-ae43-df06bc3e8eb8	2	20	t	7bf1dec9-7062-4948-832f-a8582f37d152	\N
5d1f71fe-91ae-4bfd-b558-9ecb6b0f6c38	\N	idp-username-password-form	2b2b321a-629d-48cd-a065-806aca97437e	7bf1dec9-7062-4948-832f-a8582f37d152	0	10	f	\N	\N
916c5404-1d37-4a4e-ab74-18f241ae8907	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	7bf1dec9-7062-4948-832f-a8582f37d152	1	20	t	dcd44839-421f-4271-b352-f50b29900fa3	\N
481b6b21-5c8d-41b8-ae0d-8affe6b64aa6	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	dcd44839-421f-4271-b352-f50b29900fa3	0	10	f	\N	\N
a942edc1-b129-4a9b-9c1e-e3b244405700	\N	auth-otp-form	2b2b321a-629d-48cd-a065-806aca97437e	dcd44839-421f-4271-b352-f50b29900fa3	0	20	f	\N	\N
8c7e11c7-1338-4591-8eee-db45df978bcf	\N	\N	2b2b321a-629d-48cd-a065-806aca97437e	e93fd7c4-2626-4d5d-9f59-ca55658161ac	1	50	t	256d3082-7949-435f-bba5-7cc94f32f7bb	\N
92bc32b8-e6c7-4a0d-a915-08f55ef4e73e	\N	conditional-user-configured	2b2b321a-629d-48cd-a065-806aca97437e	256d3082-7949-435f-bba5-7cc94f32f7bb	0	10	f	\N	\N
a1ef67fc-47d2-4ec9-af5d-2469ea4c2c45	\N	idp-add-organization-member	2b2b321a-629d-48cd-a065-806aca97437e	256d3082-7949-435f-bba5-7cc94f32f7bb	0	20	f	\N	\N
e046abfa-210e-462f-99a5-4d2bd7c65dba	\N	http-basic-authenticator	2b2b321a-629d-48cd-a065-806aca97437e	7a169a50-ada9-49b3-963e-b4d5dc7d9d2b	0	10	f	\N	\N
3c83602e-5adf-48b4-b262-5fe090c5e5c8	\N	docker-http-basic-authenticator	2b2b321a-629d-48cd-a065-806aca97437e	5a668e2c-cabd-454a-b45c-600421691497	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
7174faff-f0d8-45d1-bbfe-1006dfadf9b9	browser	Browser based authentication	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
2a0ebd97-840f-4ed5-b3ad-5c3ee7f0dca8	forms	Username, password, otp and other auth forms.	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
918b26ec-a8a3-4d48-a497-73b852a9df0d	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
46ce77d8-5b4a-44ff-8ad1-9a39f2a70f49	direct grant	OpenID Connect Resource Owner Grant	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
b55675f4-d6e1-4d89-b8a5-5e859aa5a95f	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
82b1302a-e904-4266-86fc-7130a89ba62d	registration	Registration flow	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
ac7a1069-7c03-4f69-bdcd-8784ebe4f993	registration form	Registration form	a03a5306-1fa8-4e80-a095-103e9f150252	form-flow	f	t
daf4aaa6-2ae3-4277-8b45-e1d4a7481812	reset credentials	Reset credentials for a user if they forgot their password or something	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
753ad7f5-b763-4d00-8fb0-025c69780ff9	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
f5709df3-9eec-4eee-9873-2b0726ba991f	clients	Base authentication for clients	a03a5306-1fa8-4e80-a095-103e9f150252	client-flow	t	t
3ce1064a-3925-4dea-8fb1-4021c4461ec9	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
7bf65578-e11b-45f1-a906-27152974e02a	User creation or linking	Flow for the existing/non-existing user alternatives	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
655221c4-930a-4c0c-bf13-ca53df4873d3	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
e2f00ad3-2a08-49c9-b164-5987fe8ab507	Account verification options	Method with which to verity the existing account	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
56238f77-a314-401a-9de4-dbe977fe6383	Verify Existing Account by Re-authentication	Reauthentication of existing account	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
8fa664dc-6cd1-423d-88ab-206f099522ae	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	f	t
3f9c9e38-57ea-4133-b8a2-6b4c9535bb33	saml ecp	SAML ECP Profile Authentication Flow	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
fae4ec2b-2a71-49b8-a9b6-04550c1adc9f	docker auth	Used by Docker clients to authenticate against the IDP	a03a5306-1fa8-4e80-a095-103e9f150252	basic-flow	t	t
87de095b-67d4-4669-91f6-8d81cac3a26f	browser	Browser based authentication	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
751b4f2c-eaab-41ba-945d-c6e2bb885ee2	forms	Username, password, otp and other auth forms.	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
3338b88a-2322-4407-89bb-04012d0dc572	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
e0ad8a1d-7689-4e59-a0f4-6a721159ffac	Organization	\N	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
3dd32315-5392-4619-a27d-0f6ed3605e91	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
56f10eb0-69ee-4eb8-a783-50db29cd5000	direct grant	OpenID Connect Resource Owner Grant	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
82f007ea-3bea-401c-9e05-e86d4fa8ef2f	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
f82c8f01-5e2e-46dd-8c06-9b03280c0103	registration	Registration flow	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
dc22d90b-a8f0-4b95-b993-60d201dda9a2	registration form	Registration form	2b2b321a-629d-48cd-a065-806aca97437e	form-flow	f	t
4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	reset credentials	Reset credentials for a user if they forgot their password or something	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
b54e7b79-3a9b-4222-94f0-e3495c3e1d23	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
500a092f-1606-4ba2-b90b-426cca2135e6	clients	Base authentication for clients	2b2b321a-629d-48cd-a065-806aca97437e	client-flow	t	t
e93fd7c4-2626-4d5d-9f59-ca55658161ac	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
2ee02093-2546-4a56-8366-9f35ca500436	User creation or linking	Flow for the existing/non-existing user alternatives	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
7d9324cc-3437-42ca-800d-bcbb4776db94	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
382442a4-81a5-4784-ae43-df06bc3e8eb8	Account verification options	Method with which to verity the existing account	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
7bf1dec9-7062-4948-832f-a8582f37d152	Verify Existing Account by Re-authentication	Reauthentication of existing account	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
dcd44839-421f-4271-b352-f50b29900fa3	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
256d3082-7949-435f-bba5-7cc94f32f7bb	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	f	t
7a169a50-ada9-49b3-963e-b4d5dc7d9d2b	saml ecp	SAML ECP Profile Authentication Flow	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
5a668e2c-cabd-454a-b45c-600421691497	docker auth	Used by Docker clients to authenticate against the IDP	2b2b321a-629d-48cd-a065-806aca97437e	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
d8418a1f-9844-4838-8a7b-f6e763d10bce	review profile config	a03a5306-1fa8-4e80-a095-103e9f150252
89a661cb-6f2d-4a9a-8198-776fe61771f3	create unique user config	a03a5306-1fa8-4e80-a095-103e9f150252
2af53d60-0045-4296-adc2-d62b6fe61a85	review profile config	2b2b321a-629d-48cd-a065-806aca97437e
82c6f379-4df0-48ca-aa71-a042a0fdc55d	create unique user config	2b2b321a-629d-48cd-a065-806aca97437e
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
89a661cb-6f2d-4a9a-8198-776fe61771f3	false	require.password.update.after.registration
d8418a1f-9844-4838-8a7b-f6e763d10bce	missing	update.profile.on.first.login
2af53d60-0045-4296-adc2-d62b6fe61a85	missing	update.profile.on.first.login
82c6f379-4df0-48ca-aa71-a042a0fdc55d	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	f	master-realm	0	f	\N	\N	t	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
117ec0a4-3700-45dd-8142-eb1835f74494	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6c4ad828-794d-4384-b0ee-944d9602d13c	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	t	f	broker	0	f	\N	\N	t	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
29b077e7-8390-497f-bf45-178344bcf36d	t	t	admin-cli	0	t	\N	\N	f	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
54444296-874f-4a02-ab26-3c1263f65609	t	f	infozhur-realm	0	f	\N	\N	t	\N	f	a03a5306-1fa8-4e80-a095-103e9f150252	\N	0	f	f	infozhur Realm	f	client-secret	\N	\N	\N	t	f	f	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	f	realm-management	0	f	\N	\N	t	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	f	account	0	t	\N	/realms/infozhur/account/	f	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
08d131cd-0552-48c8-9846-9df64a4f58aa	t	f	account-console	0	t	\N	/realms/infozhur/account/	f	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	t	f	broker	0	f	\N	\N	t	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	t	t	security-admin-console	0	t	\N	/admin/infozhur/console/	f	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
28fdd488-d983-43be-9461-567c251301e7	t	t	admin-cli	0	t	\N	\N	f	\N	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	t	t	infozhur-react-app	0	t	\N	http://localhost:3000/	f	http://localhost:3000/	f	2b2b321a-629d-48cd-a065-806aca97437e	openid-connect	-1	t	f	infozhur-react-app	f	client-secret	http://localhost:3000/	react-app	\N	t	f	f	t
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
117ec0a4-3700-45dd-8142-eb1835f74494	post.logout.redirect.uris	+
6c4ad828-794d-4384-b0ee-944d9602d13c	post.logout.redirect.uris	+
6c4ad828-794d-4384-b0ee-944d9602d13c	pkce.code.challenge.method	S256
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	post.logout.redirect.uris	+
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	pkce.code.challenge.method	S256
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	client.use.lightweight.access.token.enabled	true
29b077e7-8390-497f-bf45-178344bcf36d	client.use.lightweight.access.token.enabled	true
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	post.logout.redirect.uris	+
08d131cd-0552-48c8-9846-9df64a4f58aa	post.logout.redirect.uris	+
08d131cd-0552-48c8-9846-9df64a4f58aa	pkce.code.challenge.method	S256
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	post.logout.redirect.uris	+
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	pkce.code.challenge.method	S256
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	client.use.lightweight.access.token.enabled	true
28fdd488-d983-43be-9461-567c251301e7	client.use.lightweight.access.token.enabled	true
bb02fd1e-5d55-4c51-813a-64767c0b59b8	standard.token.exchange.enabled	false
bb02fd1e-5d55-4c51-813a-64767c0b59b8	oauth2.device.authorization.grant.enabled	false
bb02fd1e-5d55-4c51-813a-64767c0b59b8	oidc.ciba.grant.enabled	false
bb02fd1e-5d55-4c51-813a-64767c0b59b8	backchannel.logout.session.required	true
bb02fd1e-5d55-4c51-813a-64767c0b59b8	backchannel.logout.revoke.offline.tokens	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
735b5041-cf2d-41d2-b952-962ad1f6e8c9	offline_access	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect built-in scope: offline_access	openid-connect
78b1a598-4032-4af4-b5b5-f106050b02c6	role_list	a03a5306-1fa8-4e80-a095-103e9f150252	SAML role list	saml
afae1287-ca54-4d89-944e-8eb2f722c366	saml_organization	a03a5306-1fa8-4e80-a095-103e9f150252	Organization Membership	saml
e7657ce3-dd29-4079-bcef-0996e4d24216	profile	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect built-in scope: profile	openid-connect
8fcbde4b-3469-4c70-8be5-26bef75244d6	email	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect built-in scope: email	openid-connect
361fb528-9380-4965-b6ec-54d63e588721	address	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect built-in scope: address	openid-connect
4fb30195-1386-4bef-ae48-5c2a89513364	phone	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect built-in scope: phone	openid-connect
06227a4f-b49e-4298-a084-cd33d77fe168	roles	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect scope for add user roles to the access token	openid-connect
03844f51-f57d-4218-9fb0-e42e0b530222	web-origins	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d43aafb4-6442-4037-a900-4f5ec05d7f6b	microprofile-jwt	a03a5306-1fa8-4e80-a095-103e9f150252	Microprofile - JWT built-in scope	openid-connect
09272df3-c36a-4f73-b6c2-321368cffc2b	acr	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
c133bf0f-9de2-4f85-a773-f0f17ac43f21	basic	a03a5306-1fa8-4e80-a095-103e9f150252	OpenID Connect scope for add all basic claims to the token	openid-connect
3905a7cf-5b1a-4ef3-8423-c6d19f8b0420	service_account	a03a5306-1fa8-4e80-a095-103e9f150252	Specific scope for a client enabled for service accounts	openid-connect
3b078ae4-540f-43e3-8a6c-b8043b0bc58e	organization	a03a5306-1fa8-4e80-a095-103e9f150252	Additional claims about the organization a subject belongs to	openid-connect
cc552e0e-75a3-4248-9294-05bbf24907c5	offline_access	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect built-in scope: offline_access	openid-connect
a84bc83c-78b7-49d5-97b8-86c0c747991d	role_list	2b2b321a-629d-48cd-a065-806aca97437e	SAML role list	saml
4ab4bb65-bd10-408d-8b13-36e1fe495ec2	saml_organization	2b2b321a-629d-48cd-a065-806aca97437e	Organization Membership	saml
04e9cc6b-62b9-4e92-b75d-5e25a5d88469	profile	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect built-in scope: profile	openid-connect
3d158b09-68cd-4aed-9b4e-602ff6a04c2f	email	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect built-in scope: email	openid-connect
7b93052a-49f9-4b9a-86f7-14971d17c419	address	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect built-in scope: address	openid-connect
7e8d0f86-8acc-4e23-b2e9-e38ab4540375	phone	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect built-in scope: phone	openid-connect
a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	roles	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect scope for add user roles to the access token	openid-connect
3a771edb-6aa0-4b55-acc3-8127ff9c83da	web-origins	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect scope for add allowed web origins to the access token	openid-connect
aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	microprofile-jwt	2b2b321a-629d-48cd-a065-806aca97437e	Microprofile - JWT built-in scope	openid-connect
3b614f98-c24c-4953-9d65-4b1fe3dc8283	acr	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
893bd505-8615-492d-ba4e-210bbdca498c	basic	2b2b321a-629d-48cd-a065-806aca97437e	OpenID Connect scope for add all basic claims to the token	openid-connect
ac283e23-1fda-426e-8a3f-ecb4aed0dd38	service_account	2b2b321a-629d-48cd-a065-806aca97437e	Specific scope for a client enabled for service accounts	openid-connect
9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	organization	2b2b321a-629d-48cd-a065-806aca97437e	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
735b5041-cf2d-41d2-b952-962ad1f6e8c9	true	display.on.consent.screen
735b5041-cf2d-41d2-b952-962ad1f6e8c9	${offlineAccessScopeConsentText}	consent.screen.text
78b1a598-4032-4af4-b5b5-f106050b02c6	true	display.on.consent.screen
78b1a598-4032-4af4-b5b5-f106050b02c6	${samlRoleListScopeConsentText}	consent.screen.text
afae1287-ca54-4d89-944e-8eb2f722c366	false	display.on.consent.screen
e7657ce3-dd29-4079-bcef-0996e4d24216	true	display.on.consent.screen
e7657ce3-dd29-4079-bcef-0996e4d24216	${profileScopeConsentText}	consent.screen.text
e7657ce3-dd29-4079-bcef-0996e4d24216	true	include.in.token.scope
8fcbde4b-3469-4c70-8be5-26bef75244d6	true	display.on.consent.screen
8fcbde4b-3469-4c70-8be5-26bef75244d6	${emailScopeConsentText}	consent.screen.text
8fcbde4b-3469-4c70-8be5-26bef75244d6	true	include.in.token.scope
361fb528-9380-4965-b6ec-54d63e588721	true	display.on.consent.screen
361fb528-9380-4965-b6ec-54d63e588721	${addressScopeConsentText}	consent.screen.text
361fb528-9380-4965-b6ec-54d63e588721	true	include.in.token.scope
4fb30195-1386-4bef-ae48-5c2a89513364	true	display.on.consent.screen
4fb30195-1386-4bef-ae48-5c2a89513364	${phoneScopeConsentText}	consent.screen.text
4fb30195-1386-4bef-ae48-5c2a89513364	true	include.in.token.scope
06227a4f-b49e-4298-a084-cd33d77fe168	true	display.on.consent.screen
06227a4f-b49e-4298-a084-cd33d77fe168	${rolesScopeConsentText}	consent.screen.text
06227a4f-b49e-4298-a084-cd33d77fe168	false	include.in.token.scope
03844f51-f57d-4218-9fb0-e42e0b530222	false	display.on.consent.screen
03844f51-f57d-4218-9fb0-e42e0b530222		consent.screen.text
03844f51-f57d-4218-9fb0-e42e0b530222	false	include.in.token.scope
d43aafb4-6442-4037-a900-4f5ec05d7f6b	false	display.on.consent.screen
d43aafb4-6442-4037-a900-4f5ec05d7f6b	true	include.in.token.scope
09272df3-c36a-4f73-b6c2-321368cffc2b	false	display.on.consent.screen
09272df3-c36a-4f73-b6c2-321368cffc2b	false	include.in.token.scope
c133bf0f-9de2-4f85-a773-f0f17ac43f21	false	display.on.consent.screen
c133bf0f-9de2-4f85-a773-f0f17ac43f21	false	include.in.token.scope
3905a7cf-5b1a-4ef3-8423-c6d19f8b0420	false	display.on.consent.screen
3905a7cf-5b1a-4ef3-8423-c6d19f8b0420	false	include.in.token.scope
3b078ae4-540f-43e3-8a6c-b8043b0bc58e	true	display.on.consent.screen
3b078ae4-540f-43e3-8a6c-b8043b0bc58e	${organizationScopeConsentText}	consent.screen.text
3b078ae4-540f-43e3-8a6c-b8043b0bc58e	true	include.in.token.scope
cc552e0e-75a3-4248-9294-05bbf24907c5	true	display.on.consent.screen
cc552e0e-75a3-4248-9294-05bbf24907c5	${offlineAccessScopeConsentText}	consent.screen.text
a84bc83c-78b7-49d5-97b8-86c0c747991d	true	display.on.consent.screen
a84bc83c-78b7-49d5-97b8-86c0c747991d	${samlRoleListScopeConsentText}	consent.screen.text
4ab4bb65-bd10-408d-8b13-36e1fe495ec2	false	display.on.consent.screen
04e9cc6b-62b9-4e92-b75d-5e25a5d88469	true	display.on.consent.screen
04e9cc6b-62b9-4e92-b75d-5e25a5d88469	${profileScopeConsentText}	consent.screen.text
04e9cc6b-62b9-4e92-b75d-5e25a5d88469	true	include.in.token.scope
3d158b09-68cd-4aed-9b4e-602ff6a04c2f	true	display.on.consent.screen
3d158b09-68cd-4aed-9b4e-602ff6a04c2f	${emailScopeConsentText}	consent.screen.text
3d158b09-68cd-4aed-9b4e-602ff6a04c2f	true	include.in.token.scope
7b93052a-49f9-4b9a-86f7-14971d17c419	true	display.on.consent.screen
7b93052a-49f9-4b9a-86f7-14971d17c419	${addressScopeConsentText}	consent.screen.text
7b93052a-49f9-4b9a-86f7-14971d17c419	true	include.in.token.scope
7e8d0f86-8acc-4e23-b2e9-e38ab4540375	true	display.on.consent.screen
7e8d0f86-8acc-4e23-b2e9-e38ab4540375	${phoneScopeConsentText}	consent.screen.text
7e8d0f86-8acc-4e23-b2e9-e38ab4540375	true	include.in.token.scope
a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	true	display.on.consent.screen
a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	${rolesScopeConsentText}	consent.screen.text
a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	false	include.in.token.scope
3a771edb-6aa0-4b55-acc3-8127ff9c83da	false	display.on.consent.screen
3a771edb-6aa0-4b55-acc3-8127ff9c83da		consent.screen.text
3a771edb-6aa0-4b55-acc3-8127ff9c83da	false	include.in.token.scope
aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	false	display.on.consent.screen
aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	true	include.in.token.scope
3b614f98-c24c-4953-9d65-4b1fe3dc8283	false	display.on.consent.screen
3b614f98-c24c-4953-9d65-4b1fe3dc8283	false	include.in.token.scope
893bd505-8615-492d-ba4e-210bbdca498c	false	display.on.consent.screen
893bd505-8615-492d-ba4e-210bbdca498c	false	include.in.token.scope
ac283e23-1fda-426e-8a3f-ecb4aed0dd38	false	display.on.consent.screen
ac283e23-1fda-426e-8a3f-ecb4aed0dd38	false	include.in.token.scope
9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	true	display.on.consent.screen
9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	${organizationScopeConsentText}	consent.screen.text
9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
117ec0a4-3700-45dd-8142-eb1835f74494	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
117ec0a4-3700-45dd-8142-eb1835f74494	e7657ce3-dd29-4079-bcef-0996e4d24216	t
117ec0a4-3700-45dd-8142-eb1835f74494	06227a4f-b49e-4298-a084-cd33d77fe168	t
117ec0a4-3700-45dd-8142-eb1835f74494	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
117ec0a4-3700-45dd-8142-eb1835f74494	03844f51-f57d-4218-9fb0-e42e0b530222	t
117ec0a4-3700-45dd-8142-eb1835f74494	09272df3-c36a-4f73-b6c2-321368cffc2b	t
117ec0a4-3700-45dd-8142-eb1835f74494	4fb30195-1386-4bef-ae48-5c2a89513364	f
117ec0a4-3700-45dd-8142-eb1835f74494	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
117ec0a4-3700-45dd-8142-eb1835f74494	361fb528-9380-4965-b6ec-54d63e588721	f
117ec0a4-3700-45dd-8142-eb1835f74494	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
117ec0a4-3700-45dd-8142-eb1835f74494	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
6c4ad828-794d-4384-b0ee-944d9602d13c	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
6c4ad828-794d-4384-b0ee-944d9602d13c	e7657ce3-dd29-4079-bcef-0996e4d24216	t
6c4ad828-794d-4384-b0ee-944d9602d13c	06227a4f-b49e-4298-a084-cd33d77fe168	t
6c4ad828-794d-4384-b0ee-944d9602d13c	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
6c4ad828-794d-4384-b0ee-944d9602d13c	03844f51-f57d-4218-9fb0-e42e0b530222	t
6c4ad828-794d-4384-b0ee-944d9602d13c	09272df3-c36a-4f73-b6c2-321368cffc2b	t
6c4ad828-794d-4384-b0ee-944d9602d13c	4fb30195-1386-4bef-ae48-5c2a89513364	f
6c4ad828-794d-4384-b0ee-944d9602d13c	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
6c4ad828-794d-4384-b0ee-944d9602d13c	361fb528-9380-4965-b6ec-54d63e588721	f
6c4ad828-794d-4384-b0ee-944d9602d13c	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
6c4ad828-794d-4384-b0ee-944d9602d13c	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
29b077e7-8390-497f-bf45-178344bcf36d	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
29b077e7-8390-497f-bf45-178344bcf36d	e7657ce3-dd29-4079-bcef-0996e4d24216	t
29b077e7-8390-497f-bf45-178344bcf36d	06227a4f-b49e-4298-a084-cd33d77fe168	t
29b077e7-8390-497f-bf45-178344bcf36d	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
29b077e7-8390-497f-bf45-178344bcf36d	03844f51-f57d-4218-9fb0-e42e0b530222	t
29b077e7-8390-497f-bf45-178344bcf36d	09272df3-c36a-4f73-b6c2-321368cffc2b	t
29b077e7-8390-497f-bf45-178344bcf36d	4fb30195-1386-4bef-ae48-5c2a89513364	f
29b077e7-8390-497f-bf45-178344bcf36d	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
29b077e7-8390-497f-bf45-178344bcf36d	361fb528-9380-4965-b6ec-54d63e588721	f
29b077e7-8390-497f-bf45-178344bcf36d	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
29b077e7-8390-497f-bf45-178344bcf36d	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	e7657ce3-dd29-4079-bcef-0996e4d24216	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	06227a4f-b49e-4298-a084-cd33d77fe168	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	03844f51-f57d-4218-9fb0-e42e0b530222	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	09272df3-c36a-4f73-b6c2-321368cffc2b	t
12deceff-00d7-4df2-8ed2-e678ac8e62ae	4fb30195-1386-4bef-ae48-5c2a89513364	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	361fb528-9380-4965-b6ec-54d63e588721	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
12deceff-00d7-4df2-8ed2-e678ac8e62ae	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
7d6b4c8e-f047-49a5-8671-d38d62e9944c	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	e7657ce3-dd29-4079-bcef-0996e4d24216	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	06227a4f-b49e-4298-a084-cd33d77fe168	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	03844f51-f57d-4218-9fb0-e42e0b530222	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	09272df3-c36a-4f73-b6c2-321368cffc2b	t
7d6b4c8e-f047-49a5-8671-d38d62e9944c	4fb30195-1386-4bef-ae48-5c2a89513364	f
7d6b4c8e-f047-49a5-8671-d38d62e9944c	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
7d6b4c8e-f047-49a5-8671-d38d62e9944c	361fb528-9380-4965-b6ec-54d63e588721	f
7d6b4c8e-f047-49a5-8671-d38d62e9944c	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
7d6b4c8e-f047-49a5-8671-d38d62e9944c	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	e7657ce3-dd29-4079-bcef-0996e4d24216	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	06227a4f-b49e-4298-a084-cd33d77fe168	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	03844f51-f57d-4218-9fb0-e42e0b530222	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	09272df3-c36a-4f73-b6c2-321368cffc2b	t
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	4fb30195-1386-4bef-ae48-5c2a89513364	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	361fb528-9380-4965-b6ec-54d63e588721	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	893bd505-8615-492d-ba4e-210bbdca498c	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	7b93052a-49f9-4b9a-86f7-14971d17c419	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	cc552e0e-75a3-4248-9294-05bbf24907c5	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
08d131cd-0552-48c8-9846-9df64a4f58aa	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
08d131cd-0552-48c8-9846-9df64a4f58aa	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
08d131cd-0552-48c8-9846-9df64a4f58aa	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
08d131cd-0552-48c8-9846-9df64a4f58aa	893bd505-8615-492d-ba4e-210bbdca498c	t
08d131cd-0552-48c8-9846-9df64a4f58aa	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
08d131cd-0552-48c8-9846-9df64a4f58aa	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
08d131cd-0552-48c8-9846-9df64a4f58aa	7b93052a-49f9-4b9a-86f7-14971d17c419	f
08d131cd-0552-48c8-9846-9df64a4f58aa	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
08d131cd-0552-48c8-9846-9df64a4f58aa	cc552e0e-75a3-4248-9294-05bbf24907c5	f
08d131cd-0552-48c8-9846-9df64a4f58aa	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
08d131cd-0552-48c8-9846-9df64a4f58aa	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
28fdd488-d983-43be-9461-567c251301e7	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
28fdd488-d983-43be-9461-567c251301e7	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
28fdd488-d983-43be-9461-567c251301e7	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
28fdd488-d983-43be-9461-567c251301e7	893bd505-8615-492d-ba4e-210bbdca498c	t
28fdd488-d983-43be-9461-567c251301e7	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
28fdd488-d983-43be-9461-567c251301e7	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
28fdd488-d983-43be-9461-567c251301e7	7b93052a-49f9-4b9a-86f7-14971d17c419	f
28fdd488-d983-43be-9461-567c251301e7	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
28fdd488-d983-43be-9461-567c251301e7	cc552e0e-75a3-4248-9294-05bbf24907c5	f
28fdd488-d983-43be-9461-567c251301e7	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
28fdd488-d983-43be-9461-567c251301e7	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	893bd505-8615-492d-ba4e-210bbdca498c	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	7b93052a-49f9-4b9a-86f7-14971d17c419	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	cc552e0e-75a3-4248-9294-05bbf24907c5	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
b62b5819-af78-4c2a-87ad-8a7456b6b4ab	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	893bd505-8615-492d-ba4e-210bbdca498c	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	7b93052a-49f9-4b9a-86f7-14971d17c419	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	cc552e0e-75a3-4248-9294-05bbf24907c5	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
6b25ca04-2b23-4ccd-89ee-39b148a7ddac	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	893bd505-8615-492d-ba4e-210bbdca498c	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	7b93052a-49f9-4b9a-86f7-14971d17c419	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	cc552e0e-75a3-4248-9294-05bbf24907c5	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	893bd505-8615-492d-ba4e-210bbdca498c	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
bb02fd1e-5d55-4c51-813a-64767c0b59b8	7b93052a-49f9-4b9a-86f7-14971d17c419	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	cc552e0e-75a3-4248-9294-05bbf24907c5	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
bb02fd1e-5d55-4c51-813a-64767c0b59b8	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
735b5041-cf2d-41d2-b952-962ad1f6e8c9	ca3eed16-7f5b-480b-9b8b-b08891c3ba5a
cc552e0e-75a3-4248-9294-05bbf24907c5	962f9915-967b-4dd8-b0d7-873a90f103d4
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
c531b1a3-cf2e-4349-ac8c-5518759ccbd4	Trusted Hosts	a03a5306-1fa8-4e80-a095-103e9f150252	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
c197b297-86c8-43f4-8e94-b23aaa1a0120	Consent Required	a03a5306-1fa8-4e80-a095-103e9f150252	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
05efed0d-0403-4e5b-a623-b66d9184addc	Full Scope Disabled	a03a5306-1fa8-4e80-a095-103e9f150252	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
c97cdf6c-2948-4422-bd1e-31a46b795696	Max Clients Limit	a03a5306-1fa8-4e80-a095-103e9f150252	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
8d58eace-5390-4621-a306-dbc88af03bdf	Allowed Protocol Mapper Types	a03a5306-1fa8-4e80-a095-103e9f150252	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
abe2ebb4-d3f7-41bf-a497-5ef5a921b0ce	Allowed Client Scopes	a03a5306-1fa8-4e80-a095-103e9f150252	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	anonymous
160281d6-df32-4d3c-a7df-511d5605d6bf	Allowed Protocol Mapper Types	a03a5306-1fa8-4e80-a095-103e9f150252	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	authenticated
57d71da1-3a57-4797-ad02-057d9ea103a2	Allowed Client Scopes	a03a5306-1fa8-4e80-a095-103e9f150252	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	authenticated
955b6063-2930-41b3-80a5-c4b73e5a0f30	rsa-generated	a03a5306-1fa8-4e80-a095-103e9f150252	rsa-generated	org.keycloak.keys.KeyProvider	a03a5306-1fa8-4e80-a095-103e9f150252	\N
c3221c01-870f-4ba7-9ec1-d09a4fa517c6	rsa-enc-generated	a03a5306-1fa8-4e80-a095-103e9f150252	rsa-enc-generated	org.keycloak.keys.KeyProvider	a03a5306-1fa8-4e80-a095-103e9f150252	\N
f7169504-596d-4778-b0ee-ac9fc57df7c0	hmac-generated-hs512	a03a5306-1fa8-4e80-a095-103e9f150252	hmac-generated	org.keycloak.keys.KeyProvider	a03a5306-1fa8-4e80-a095-103e9f150252	\N
2b52972c-816b-4f86-85f8-d4a92d17de4d	aes-generated	a03a5306-1fa8-4e80-a095-103e9f150252	aes-generated	org.keycloak.keys.KeyProvider	a03a5306-1fa8-4e80-a095-103e9f150252	\N
25b54d45-cfd0-439c-a179-c247adb978e6	\N	a03a5306-1fa8-4e80-a095-103e9f150252	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	a03a5306-1fa8-4e80-a095-103e9f150252	\N
ec1a690d-819f-4296-bcbd-24b95fda9bb3	rsa-generated	2b2b321a-629d-48cd-a065-806aca97437e	rsa-generated	org.keycloak.keys.KeyProvider	2b2b321a-629d-48cd-a065-806aca97437e	\N
fd681a95-6d7c-448b-9297-272761709332	rsa-enc-generated	2b2b321a-629d-48cd-a065-806aca97437e	rsa-enc-generated	org.keycloak.keys.KeyProvider	2b2b321a-629d-48cd-a065-806aca97437e	\N
81cf5c8e-4060-4873-8ec6-5a2dba41427c	hmac-generated-hs512	2b2b321a-629d-48cd-a065-806aca97437e	hmac-generated	org.keycloak.keys.KeyProvider	2b2b321a-629d-48cd-a065-806aca97437e	\N
285ac11e-88e7-44a5-be2c-b1bbdc512e26	aes-generated	2b2b321a-629d-48cd-a065-806aca97437e	aes-generated	org.keycloak.keys.KeyProvider	2b2b321a-629d-48cd-a065-806aca97437e	\N
eb989e1e-5770-4045-9cb0-74ebdff30e89	Trusted Hosts	2b2b321a-629d-48cd-a065-806aca97437e	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
91ed1127-f027-479a-be80-304100ebe507	Consent Required	2b2b321a-629d-48cd-a065-806aca97437e	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
bf8978fb-a624-436b-ae96-7c4cf0b62358	Full Scope Disabled	2b2b321a-629d-48cd-a065-806aca97437e	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
add9a217-c94a-4d5e-8e06-a3ac57523ecc	Max Clients Limit	2b2b321a-629d-48cd-a065-806aca97437e	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
a84009f9-3326-4fbe-845d-edd688269d76	Allowed Protocol Mapper Types	2b2b321a-629d-48cd-a065-806aca97437e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
eedc66e0-2c8a-4316-ba29-b6b5b25bda84	Allowed Client Scopes	2b2b321a-629d-48cd-a065-806aca97437e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	anonymous
81d3d17f-9051-434b-a7ed-6368a5588614	Allowed Protocol Mapper Types	2b2b321a-629d-48cd-a065-806aca97437e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	authenticated
8c262718-5558-4f8b-bde5-8430710b0399	Allowed Client Scopes	2b2b321a-629d-48cd-a065-806aca97437e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2b2b321a-629d-48cd-a065-806aca97437e	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
63c92ef8-3e69-45fb-9287-cb7910b60b16	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3fff13d8-d0ff-479f-9789-a6e459b9b6da	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	saml-role-list-mapper
b41a1bc4-968d-4277-a9d1-1c0055dbfff8	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	saml-user-attribute-mapper
4f3e051f-1156-45c9-9e9a-362622156afa	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	oidc-full-name-mapper
b90df896-c971-4883-8f1f-7953887409d7	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	saml-user-property-mapper
227a6ea5-fc61-497c-a359-96d6308154f8	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	oidc-address-mapper
f842c3b5-6664-43dd-b18c-c7c5d72ad93c	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
59d39b10-8a15-4c33-af4b-58feb2ee8c85	8d58eace-5390-4621-a306-dbc88af03bdf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d9db86f5-f505-45dd-872d-6965aba0e9d8	c531b1a3-cf2e-4349-ac8c-5518759ccbd4	client-uris-must-match	true
9686aefd-d8c5-4e01-b24d-a881f3f4e2e1	c531b1a3-cf2e-4349-ac8c-5518759ccbd4	host-sending-registration-request-must-match	true
18dae556-37b0-4b0b-b5f5-1fd55ae517b6	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	saml-user-attribute-mapper
206c0c74-2d7d-4c54-b8f4-0160989622d6	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	oidc-address-mapper
59b0c635-0d5f-415f-8047-5e3458ec2ae9	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	saml-user-property-mapper
ae633324-742e-4f7e-ae29-2f35ebe745b3	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	saml-role-list-mapper
a35e0ac2-97f0-4390-a16f-4a48c59f8a69	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3942599b-ee1f-4603-9eba-5ffd2e6a534f	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
0725cc2c-ea2f-42f7-a8b8-6a38876f0297	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	oidc-full-name-mapper
c10488dc-c0b3-4714-a270-a39cbe37b8cc	160281d6-df32-4d3c-a7df-511d5605d6bf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a4b9820f-e6c1-409f-ac7f-32a1bcd0a85c	57d71da1-3a57-4797-ad02-057d9ea103a2	allow-default-scopes	true
2e8dc793-a7ed-4144-83df-b5e57ff6ad53	c97cdf6c-2948-4422-bd1e-31a46b795696	max-clients	200
156adb5c-d8b4-481d-95f1-cc944def9536	abe2ebb4-d3f7-41bf-a497-5ef5a921b0ce	allow-default-scopes	true
057aef41-48ab-4abc-b119-c281c290c2a8	2b52972c-816b-4f86-85f8-d4a92d17de4d	kid	e79d89f7-efd9-4a8f-bc63-33c185ad882b
06aa7cde-77dd-4d60-967a-b2867ce663a7	2b52972c-816b-4f86-85f8-d4a92d17de4d	secret	a0mmQi3JGpFSvKuKFVDsbg
08c18a99-2b87-4ec6-b31a-a171cab859d2	2b52972c-816b-4f86-85f8-d4a92d17de4d	priority	100
2691d671-5703-44de-bb79-403203d414a3	955b6063-2930-41b3-80a5-c4b73e5a0f30	priority	100
83ec835f-4337-4a58-8d34-61364966cabe	955b6063-2930-41b3-80a5-c4b73e5a0f30	certificate	MIICmzCCAYMCBgGXMhLw6jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNjAyMTkxNDUxWhcNMzUwNjAyMTkxNjMxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCWaY6Ycnzb6ehLyRo/48+7UD9diEt313cdw+jueda1WAWF45iMPsECFnkKE54tODvqVfmM0AszeQNOStc7OHtAhAAqQqzIzJlhbOlFgM12D+AtMJmLE1TSViBqR0+d4pOqFPbWgh01BFzM9jOe9YYe6VnPaQTDc/uEQNq586h81S7exQsgrs/q8h8kel36MnSCr7hSFdfVhn8bAN07g2T8Spp/axTzCmyHW+5LVpyXafirf+m4+WrKG3+LOzimH+lW+7c7SZnCB9Vd8/NE9aM5dnqBPOJxIVA3Eawrv7NPyUeEQdlks+7jX82JEEd4iVWLeHnUR7oYUyqCHHAx2jJ5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADE7julSaKm7iPzwPPaP4woepqCNPqHT6l+s1YO5v4ZyGE4wddkNb4xsz9+irciyKJ930z3BiRzPXtfzugTCv6FTS3gIRQgZuKOBrIMVREUVD867XUBlCiU188qK2KciakAJqGCg5OCUAOnDiR/KD3vfZdxeV6t0SmxocZLR1FiW6PLYIO8TENZMl+4XWeGIq/pfxBTr2NA49U/6FP+yjsdW9q8mIp4Hv5aXpieeA98r33wDP3rw05xdzWS0qZC9Smwbu+dswdR1jiYJ4FbA0ZrRemVWDzTHT3NTG0PBC+S20wwSvHLDLEhUA6HLXD62XHRcU1YBZeD9eHW3p3QkCPQ=
18932287-3a0e-47d8-b94c-37c66de90b62	955b6063-2930-41b3-80a5-c4b73e5a0f30	privateKey	MIIEogIBAAKCAQEAlmmOmHJ82+noS8kaP+PPu1A/XYhLd9d3HcPo7nnWtVgFheOYjD7BAhZ5ChOeLTg76lX5jNALM3kDTkrXOzh7QIQAKkKsyMyZYWzpRYDNdg/gLTCZixNU0lYgakdPneKTqhT21oIdNQRczPYznvWGHulZz2kEw3P7hEDaufOofNUu3sULIK7P6vIfJHpd+jJ0gq+4UhXX1YZ/GwDdO4Nk/Eqaf2sU8wpsh1vuS1acl2n4q3/puPlqyht/izs4ph/pVvu3O0mZwgfVXfPzRPWjOXZ6gTzicSFQNxGsK7+zT8lHhEHZZLPu41/NiRBHeIlVi3h51Ee6GFMqghxwMdoyeQIDAQABAoIBAAankeb9vbdvEFd2BMLJ3fFwGfWV55zcPAlllwMiAdVRGSF00dV2m0xv2RgQiSGACOqTtjA8LhqvYm2O0xnsJEvU6zrzaziREMImMuXfzndIOYdWTJzCFLEfnVyGXifik9zlA4y3AfrMAB0TUXJZc38fnNkX0N2i3oBZ7DNo683mAUgIuXZghxcFeX+98G7Z8Z3dkmB9ewa5K++fvna8WyZQXIJ4YtFQDMar7a5XvrsInpQLNJdD+gQVHo6v/qYe1u3gNVoDQBcHKtR0moKgtUwyh5ZJ6I9OWvBiCDqk7rQUya9zvy9PH6AiURH76T7memeH8jiq0CFWHBr8WQopRBcCgYEAyQL/OnFxA7XBzK7ie3Ahr49CJV5nUhahMiicxug4tRRs1Kbgp6ot+DPIsBoTbLjGt91ykRhT7xtN7PPfAnmoRFuYexuRkhz/RKYrnseP1ShyRpA0B3KGtdyuhZsnCqbhHPUYlqMCAh7T3IA6/DLxMlnbttFeH0abjYkVZ25grGcCgYEAv48MGF4w6PyADBJ99L7rKQBj4n8ma5fxHhUSzrkbdiX6ZQyvknAHqkC0+69v2xXr0Ysw08vQlqaJLcemnH4uiPmFeMKmq+4HCGK4Tug16eLxl66vKkLQ9/b5Xjd/EV8vQty7GwVMe/QCGeMAiVAgFC76ECrzEd3WCNslI6W83h8CgYBOXmPBll7YcnF3aquUMph/iNviE9c2cuov0xOknP8W4jq4AcPOupOnlBDnT5NJLRUUtDqphRGcREnyWvYUUfgfhpKBVLNBgxqm2h5hji5ujZFYH3qZeLY6iypjnqTvCzbzAj+u4yiySPCSpE/a6cWNuujlcuU+TlnxKYP1ylvYewKBgAckAvRplnMo7nEEw3M7JrL5k7+es8Tw/gj8Ch5woghuc/4OUgEocfCzxstXB9ln4MmH4cMTZuwmuxhcx+YvgfaTLpmI0AO6tMJoQ6yVVWUpk43u8hKmOPn1V+heMztni/B3H/Zq5SX9u5JRdvSnavq1oZa2syboWREtch35EKhLAoGARORdmJhvMhrCf+BwIE3U7nHLBmd/yhrQnFPZjLyYG4WyhkQ4H7HejA7LPZLFr4pgJZqMzTaaduUNrccgUxRtRshceG/qq1SgGUyi7P1ErdyyMSru/ify7eNFx7keR9Vrn9n2Cs512bKMyuH2/F3xDhUK+MeqT1XhjDOk4PHJ+ds=
2383ef30-0415-4660-88be-9d58a97765b3	955b6063-2930-41b3-80a5-c4b73e5a0f30	keyUse	SIG
b2fe451f-91d3-4539-97a6-d57186c9c1e7	ec1a690d-819f-4296-bcbd-24b95fda9bb3	certificate	MIICnzCCAYcCBgGXMh50iTANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhpbmZvemh1cjAeFw0yNTA2MDIxOTI3MjZaFw0zNTA2MDIxOTI5MDZaMBMxETAPBgNVBAMMCGluZm96aHVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtmQHKfv/B6Cq6fSO48PKU9N8u5yYPKoE73UHqvOSWJrWd1yS8JeM4xIxebDQkpHKDuZ/liJwcTfYnIAM5i7r0EK3/AitZ1scpssQQSh5XFmtRrwS6g699OL39WrmXB03Nd8OCOjaMky8cJsyF1ihp9BAsroTMuYtXtms1+MyljebBCyzr1OSra334/gyWDonMOKkvg7R0SROU3bsEal1z9JQTHgEXv3uLQ73hwSIL5NI37stEw1KhOLip29GqMQCpSGrlrnTEiKymg42LkUqJSY7TPAfkMGxNtsnix1gFYJPGVQwPDGsXR2vgg9l4Xnp/CQPFxP5Tu8V49bWJ6KjewIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCrCQoVXaubuH/47fxJ8NGRui7E12GsN0k3k7YgEC2fN9vUdDH6fYR+OejzQwWnO7BZPIn4CqpUw257ral3LOkmpXE+NfGocQKWYx4GwdjvNqwpv2w53diYePkeyQK/c1o4zcX1/btF397PBRFuEheW6a7CN2VTrYvyDq/HPXH+6ib9lhGJhS7ed9RNTz+qJiSXqhjSXmFPS5BPVQCRNvuvg1PUneQuBoBzwRFcnM08JwTzY7G/wdrSlL3VSHKo9ohQH4wOx0lvzOU5AalEQDHmSavosojT6SKf7dDKTePO7BPJOTk9r7rayASKOdp6jgZfOznnrgowneuFIAzn5EIe
4074ae5b-df32-4c2c-bc05-cf2c2fb494df	fd681a95-6d7c-448b-9297-272761709332	priority	100
bd446b27-b6d2-4376-a21b-806715acae2f	c3221c01-870f-4ba7-9ec1-d09a4fa517c6	privateKey	MIIEowIBAAKCAQEAn5tVjAQn7sA6cMMbCSh7orOf2GINy8uYHi6+ScYD3lvgmK+aHgxHF1wnc7AiShHSzuODG1smqv9OsqbsKGyW1EVcXzi6kfTQ37EHAZBjyaaZ+O4LruikwkCvDgEOpudAqkg43cNbSQ9gEDRh70QsduEmeMObWeHREqXef+wy41G9YWZYlruhIbFXitZPTdCpL9hXqAnwLY2x3Y+ayIZs5H4EqK+qeDYETTbWqZcmEJfCo+R4OG+LeHClSOKJ42JCh+ZDKuT2aB/BqrtxF0+AF4OglVWVgXi1147gMiZa1e9qa4NoMoGm+5BReU1uZKderFQMhbFxluPlF6WSejlq7wIDAQABAoIBAA7lq71u4d9J9+pwe4SGT8vm4iOLO2hrL16Z1E8EeXX2s2bs9QCa+sO2aURGC11Ifpmq6KDUCC7rt4e7Rs2bHRThCHcmz1syM5C9cD74IChBMZvndBW2RzKOYQh4lsqDSSjbptskEdAm7Dt2+DEh9th9uV6KO2TPS/lmm/bqr/FBmP+LrhQLJWkT1b9ZYpmnX/+ls1d37kyAb1g3t9q9ElLLB4J6kjosEzP+EPBJ7vfV6jPdwwO4lZA497DzOagcrjqC47flm+01unYTkBGlLZRQU+oYswM+n9dmQelN4mSK2KDBuz2gG0mrR5ZcmeMLR9vbLBlPkIxMW6VnxpWIV/ECgYEA3KQTrqepG7cdl5r4SgwH+QpypAC0ORSHG4TfHKWOsj4n7KS8ojFNTbDOHLwGBmYBcwG87o3tF6vj5acmCr5m/+SL0iBkmR8ZG+ODSKVv9kBY8BuJQgEVpU5Xg3/DFxNfb12D9Xug3fe454ieK3BCSSBGYf2rfccxh58f7EZyaEkCgYEAuS9Lpg2n3evCdlsf7/QRhcrYX3F2M3Wm9xPiat2/+0XQaQ8JTyQI7C1I1spAFxi+JrZ0FmOsX+2W6/8xMUnLvuJqy6gOHqR74oL1xuHlmO2PiiosM4evJTWNhPm1rmCfP7+DUcNVwt9S8i3HULJOR5g7CLd+8sVSXLo1tw4daXcCgYEAtsTzyOn5m4vEZ6Fnq27r69BLxq8Om3n1sUYPy5sY6W2zhMOxvmk4r/KVyhe2pfY5nRsDdlj63XD2B3a+fIfcqnyXlihfLLgmBIQibDse083Z3ovw10wushCDTdq3sJXLqGS+usr+JuDdum3hF/qV7h1eMC4BsN8gmEeoGgEBJIECgYArTCaY1ZqJJaVa/OVTujIaoRnD/whO8dQu8sQ+jkhj3Kfk2HIpwdggOFpOdg1UGSHkdUZhMb7M0wU1en4q8wEjSVcE9O8QNQ8OH+aNMKX5AppMCJ47Eh9eSM4k6CmVctvpEMMIa+5yWLrRCukOMhJhZPNwj06sPnyKV7NVcIRp8wKBgC/9XWVn1XeGDUO0HVRYqP9tqxVLKPrk7UzN8iK84iPt/n+eJVYoIHjme/CFwHzlaYgAQDUVeAUP/mjQaotfV721p34BhmgDqlOxfv/uN+R6v+EO8BY0CLG2ZS7tpviMAUif8RmDTD3GcG6hDqEIcB5XLm4bkTIU99l5gpiXamzV
135cb1f9-87da-4f8f-b46a-bb4135ea8ec0	c3221c01-870f-4ba7-9ec1-d09a4fa517c6	algorithm	RSA-OAEP
c44d442b-99ad-4882-9040-9ab122464f4c	c3221c01-870f-4ba7-9ec1-d09a4fa517c6	keyUse	ENC
dd20a6ed-f578-4a55-a2d5-5ca7782b49fc	c3221c01-870f-4ba7-9ec1-d09a4fa517c6	certificate	MIICmzCCAYMCBgGXMhLyMjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNjAyMTkxNDUxWhcNMzUwNjAyMTkxNjMxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCfm1WMBCfuwDpwwxsJKHuis5/YYg3Ly5geLr5JxgPeW+CYr5oeDEcXXCdzsCJKEdLO44MbWyaq/06ypuwobJbURVxfOLqR9NDfsQcBkGPJppn47guu6KTCQK8OAQ6m50CqSDjdw1tJD2AQNGHvRCx24SZ4w5tZ4dESpd5/7DLjUb1hZliWu6EhsVeK1k9N0Kkv2FeoCfAtjbHdj5rIhmzkfgSor6p4NgRNNtaplyYQl8Kj5Hg4b4t4cKVI4onjYkKH5kMq5PZoH8Gqu3EXT4AXg6CVVZWBeLXXjuAyJlrV72prg2gygab7kFF5TW5kp16sVAyFsXGW4+UXpZJ6OWrvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFxQhwmQZdHWXMMPQGj+W16MPM5crJXRSnhZ/EffbKXYxVqCAkbUM5gMQhXpP3s/nfTBoH7vFIzDuugsp/jR+mqBrOTMnA/jclc8dqcGsgAeh8ZjuuPCdk2GkqNoTJSgTx3Ze4wRoYzEskBP2Z2Q7J5frL/Yx7xH8IKlNndf+QVFEhkveU3RAIs2smNVXuXPGu8Jqp28FVwdP9Z9hqmoOF6WtqurDYGjGAp57p/nCYmtFIdOTVIA73u1t+po9D/mMTKoShrcIOWc9yj3vUkhNfafr9OMD+lgLetunCZnfwejFQMB4ynvYoiYXtsiAfDUA3ASxwmq3tGMRs1SHMLMp2I=
6d59e296-a4cd-4e02-af04-9e5eddd28318	c3221c01-870f-4ba7-9ec1-d09a4fa517c6	priority	100
0525b6ec-c160-44ad-adb1-e71b09e56661	f7169504-596d-4778-b0ee-ac9fc57df7c0	priority	100
c465e893-2003-4af2-9cc1-313b441f61e3	f7169504-596d-4778-b0ee-ac9fc57df7c0	secret	_xko6bN-_7i1DJI4ufAPTuFu8PYN_aDajd2C3Uj1kCWuP0_FRf6vWsWdMzlg8-1cXnvcHEpl325nEvlkx6R-fctygoCy0LOYNs2vvVmdcqfUasAopTmpfZi2wRHc_zLDqoP5ndv3bWHfgCCKnCsP5QdRTMdWHhQAfFxV90PQxMA
d277c1e8-5610-4707-b8e7-2348f287344d	f7169504-596d-4778-b0ee-ac9fc57df7c0	kid	177abc3d-d0f6-416a-978f-726529e9d965
9883bf74-8832-4230-bbc0-88fb845d5328	f7169504-596d-4778-b0ee-ac9fc57df7c0	algorithm	HS512
a4ce11da-da9b-41b9-8cb9-1f1e5b7992dd	25b54d45-cfd0-439c-a179-c247adb978e6	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
c5b13581-e712-4ee8-9967-cc16bfc03b0f	285ac11e-88e7-44a5-be2c-b1bbdc512e26	priority	100
e98e458e-a665-4e0b-a6fc-a5dea5b16913	285ac11e-88e7-44a5-be2c-b1bbdc512e26	secret	aK0hWNA03R22xSBFh-RnNw
cbd513d2-5752-4621-960e-b5a926012c77	285ac11e-88e7-44a5-be2c-b1bbdc512e26	kid	646814eb-1e92-4917-9496-901fa59c1ea9
6cd278ad-4a42-4163-8567-b7c5ad72ce0b	ec1a690d-819f-4296-bcbd-24b95fda9bb3	keyUse	SIG
1f1dcb44-62b2-45b6-b2d4-b041db06e03d	ec1a690d-819f-4296-bcbd-24b95fda9bb3	privateKey	MIIEpAIBAAKCAQEAtmQHKfv/B6Cq6fSO48PKU9N8u5yYPKoE73UHqvOSWJrWd1yS8JeM4xIxebDQkpHKDuZ/liJwcTfYnIAM5i7r0EK3/AitZ1scpssQQSh5XFmtRrwS6g699OL39WrmXB03Nd8OCOjaMky8cJsyF1ihp9BAsroTMuYtXtms1+MyljebBCyzr1OSra334/gyWDonMOKkvg7R0SROU3bsEal1z9JQTHgEXv3uLQ73hwSIL5NI37stEw1KhOLip29GqMQCpSGrlrnTEiKymg42LkUqJSY7TPAfkMGxNtsnix1gFYJPGVQwPDGsXR2vgg9l4Xnp/CQPFxP5Tu8V49bWJ6KjewIDAQABAoIBAFkcvjNRH+WGJntwNXAq9OvH5KV1eRwKpaapMznfD52i6S4gWNqb8QXwmaOvM/ioqmRlUej0oqNuebLdDXBZdHWoY2QMiUx6Q6FqjWKId+MbHYH12ffpg/3l9ug9dpeC3rq/ZIgN3K2+uEL8UJj/gNwQ78tjBoZT188D42MHamvho9KBbMaduYIj9Hib+H7TIeL38O/XzDeJ6ai/PvWTctitZKyTV52vWFHFJqOTwVoVHdsck8uOz65O0UHsuYv0OnVCbozxKpB/5qTlfaZconDrCrIlWT6Su9CbwLsr9uSSICD0s1udjNVrphwOHLvOZHFmclqudh72aUQRF8jkJmECgYEA4Tk3R1MoU7OxxShGQxX+L0YDPCWuvHlgOlIOyfRqRauDIbUu0HJAh1+NlUNrGMYnSKBWcfsE/+686g5gPQYqMuudcTuRM7GtqdxcRNzyKVdRpBpPd8fcGdwb65s0WtjmB2TYgEk2abbT7g73aCihHg3ivSTbHTq491aBHL1PGmUCgYEAz1Bu68zQhIi7cyLsSg9C1qQ217o8fTge5E1R8QSy65uPlDUrz8mBlTqT1UIkIAXQ/o0FgMsRUNh8o/DcKWLJWK7kXIQICfPt5Lmh7qodTWI84Wnz3018dC6FqM5C/uaDGzI40IjEw0gKBfQA3P29IcRGNwq+h5u9Cot2Dqh++F8CgYBVPNU57jPt8a0O494rl5A6jfG9erl15S3RBKtKLXFm6rFXOX39L7BSS4yG+Bv5JU1KxDvTKWBMCCuBHW24yrN/0AInD5c1jEIgbiCRg1k24jAovjhjKcWYF+CNO5EF7N6p37W8X3jza1kr2Igz6GSJvlGYqfEvT8EfAqMcoFzmrQKBgQDMAi7lREv94D/2cWttBc+UQUzmxZI49z0PFTeJokIfsJl+E0Tl2Tn3jAlmVwwNpyufE09TCoIjuKYO/jrpTxkseA6pLBRtFuoHptU/c5AaUo3ulME0AaBzBETrdO5gwJ5L6QQX0j8unHmgmhkvX1L7I5alG6Ga+RrygYLPseggqQKBgQCzG0aTrqOCPok9oKvCfWWBSTDZZOeJ7Y9fZL54+clZYBEygQBwXXbIQ5A4cwy8biZpRtJMoPrpof/GCr0sinyDqyskGBoYEKxDwj4FnPOJvu6xET1CU+ivipbaCIVujermej+u1NhYz0DoSVQsBUidNKHqeJT+V6220hmmhTaNXA==
aa1a1510-2b78-4bff-9d5e-908503a18329	ec1a690d-819f-4296-bcbd-24b95fda9bb3	priority	100
21572c46-b532-4565-807c-64d26c28c909	fd681a95-6d7c-448b-9297-272761709332	privateKey	MIIEowIBAAKCAQEAm/Skspcicy6W937gim18C0mLYz4TlaV0hvjzBOgu49yNBbzXWzOagJ2SuoudKLUBrHiE0f5Bvbvl1keDj4TQO89lKII5KNYSk/dlaQZR8gYRowEOeZDbXdM/Q61V7HygYOPmThDYB4L2BHSCBWDVwfiQTuZkHbv3le5iOBVjLqXJGb99KjERCkMs2Pn56b2zR6wU04+MsOpe0dNdcvQBv4I7uYzdt2zXHdovLvQ+gZQJggV1gxyDtpoJBtsdOVk0FXppIbrWvnrpMQYSnHBizF6VuD9zBVxJGyoCHwLythB0sXYvZcW6+nl41qpzq70m/YPhw7SREyuzlAqexw7/9QIDAQABAoIBAAEOyTku3jxywfJeyW4W7QL0lj3vk1lt/FrYAGn1my/PdKNn0vwa3v7lUrPyM3gtthux25DDDTYYuqfX51QHXhQxxWlfbLzSquCXCniKYu7lzKPS44K+kUZTIvg2CkGm3L2bfhnkclqmsD16ftFDhV+h7HSkimRLPJQnQEJKHtiXo44mgjz5yZmVxGrLmIgcI+b0s6kd0fDSDuDQgRD6iICGeEgq9LgNCmhwK4Z4ulcgr8vndHOZtS+WQYCuWa6IKwxIjBBvo9uGzS6O+TTxbqj2XD0qtFCgH6KWcvuLZqI+RIurSqb2y6z7MDbSCr7XjKyJ6bxHbieX3Hs3qnFAvOcCgYEAyOqqw0L2o9xQqGbxgsET2ifY5FVXVAjUygKKeaVxWqH3AgbPoFh7Eo3dSCKyiKjTOVM13FY3R1Sc6JByidqFxSd3voZAvjS0e1B2hXg0pgNGQVvqd6CqK0OZgUCigqbaQoV6RumYNdMyCCHaSBJP/rZT5AJte58rQ6SWuf/VGnsCgYEAxrZjHdXvgyNegKp3bmbDwggm63yAwVvGRthHhMjYeijKZoqTQyBOhBIaS8Dzx8ickstRjZ/9QoxaYCOPPem2A9XERBoQPnQWEz/JkTiZRDB2YLo9qtyGMipzFzCDd3alwnpna+/4KpLEl5OMv639awjv58JVhSts9O3tnEIVPE8CgYA0+zzglM35U+WpIsxZEJUtmAhn3eFTdai3RIhDn88OeVtrm2QxAmQh9mr91LiDtRFOMpUnb0zQcI2X/k9V7twLq2a2RSzZe4iEZCl89L/db0udfKGNvj5hfkgCf4rbLSitFgmynXLX7sNoxZSMINgbcPUaUVGRod2Ezug4UDBf9QKBgQDF762BbbX72cJrxeHbje/XGgmyrj0O3hz+Orfa07mWzYT3aXfQ+KBdPC8HYHc0fWdBbdeZjFFY9becZi9sC54r6cZr0850d2v51qMwzcEVxHRWW43L4Yim9dPYuJFr8TqiIw1b3hhESBgdqHMeB/ETqj5WjCRl12DcBRiXetfuTwKBgD2hJWVUFLFADSLVSRnUMu/ocqUt4N8qQGsTSpPdGBjuPPN4DVkOQ8EykzqYV5IXumSx+pNwurp/S2c3ELNlQ6ul2j8fbmZqQS+hn+lyVzTFTaz7V22tDWilGssttKgfk/oNL63XMfCqOsZgje43lkZdGrVb79O7jdhtdLO1F1kY
a7721432-88c3-4afa-bde5-dfe5b7fdc9c3	fd681a95-6d7c-448b-9297-272761709332	certificate	MIICnzCCAYcCBgGXMh511DANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhpbmZvemh1cjAeFw0yNTA2MDIxOTI3MjZaFw0zNTA2MDIxOTI5MDZaMBMxETAPBgNVBAMMCGluZm96aHVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm/Skspcicy6W937gim18C0mLYz4TlaV0hvjzBOgu49yNBbzXWzOagJ2SuoudKLUBrHiE0f5Bvbvl1keDj4TQO89lKII5KNYSk/dlaQZR8gYRowEOeZDbXdM/Q61V7HygYOPmThDYB4L2BHSCBWDVwfiQTuZkHbv3le5iOBVjLqXJGb99KjERCkMs2Pn56b2zR6wU04+MsOpe0dNdcvQBv4I7uYzdt2zXHdovLvQ+gZQJggV1gxyDtpoJBtsdOVk0FXppIbrWvnrpMQYSnHBizF6VuD9zBVxJGyoCHwLythB0sXYvZcW6+nl41qpzq70m/YPhw7SREyuzlAqexw7/9QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAMX2D/Tkv21WlIAdeyIn4hoZIMN1boKAPuGqQ2JqoUdkc8sg2ThCKxMWqtFxhtF/KmdNX/fSHavcKV4P4miS459foLFxRrfnH4wykJExOjWbudaEkrQqdR0D7N+jTjMcrw+S2WT84/+E79ZwUvRVclSC/iOVmvufMk+mM8P07NIemp+XtwCuVOF0NszBlKGgjvt42d30KfrXIX+q0Smjt2u3z2dag7dZjAyDvxpJrKigtorhAkF7eWo08TkbGCoEVWggw1jvjrjFjn+l00s3Ca5aQVcVscSbkA+f5oDVq9lfHNoXchU1HfYTsHzHLF4U2HOwCxu9h/7MSlZebh5y9L
6968ba9d-105a-41e4-8d48-f0cbae4b76b1	fd681a95-6d7c-448b-9297-272761709332	algorithm	RSA-OAEP
5b0232f1-0b39-4cd3-b5f2-75afb3e9696f	fd681a95-6d7c-448b-9297-272761709332	keyUse	ENC
4ac48f6f-ae7b-416a-a677-3bc591f54fd8	81cf5c8e-4060-4873-8ec6-5a2dba41427c	algorithm	HS512
5d542139-44e9-4e31-aeef-80bdab79f35c	81cf5c8e-4060-4873-8ec6-5a2dba41427c	secret	oszOaPT9WIAKm8EuSEHekagTZgVQ3tfnqEXLLh_823SfWL_cg_BWRRJMIGDIIEkYmkcIMOhWasutIZXpjZr-9oFjKw1idk5ISrLf-AhU-SNnzzHpH7IHwWooWrSDGEFcPXwMT-7cVGX4bL7Vi7UKf40Njb8tnBR62fiTrS4hoaU
4cbee7a1-d5b7-4052-a54f-0bf31a80fd32	81cf5c8e-4060-4873-8ec6-5a2dba41427c	kid	991a8dda-3bb3-49cb-89dd-00490b590c0e
bb24c22c-c101-410c-9a6e-7cad09414ee6	81cf5c8e-4060-4873-8ec6-5a2dba41427c	priority	100
b8f9b307-0620-4394-9515-bc10216a0fbb	8c262718-5558-4f8b-bde5-8430710b0399	allow-default-scopes	true
6f7dc0ef-b549-40c2-83e7-1e6d2302ab50	add9a217-c94a-4d5e-8e06-a3ac57523ecc	max-clients	200
2bc9d732-02aa-46ae-be4e-1b34d3e841b4	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	oidc-address-mapper
5982bed9-5623-4331-9584-22075a020b96	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	saml-role-list-mapper
45b4795e-34ea-4648-87ce-85d405783b1c	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b6fecf0d-fc12-47a2-b133-2f754e70febf	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
783871a3-886a-4e64-aa43-20a2dd8eeab4	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	saml-user-property-mapper
d5c7776c-f0ce-473e-8a62-2831b7c39572	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	saml-user-attribute-mapper
7a4bb731-5c85-409f-9865-6bdcc4f3f9d1	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	oidc-full-name-mapper
0ab82a52-a797-4b27-940f-68e4873494d9	a84009f9-3326-4fbe-845d-edd688269d76	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
9131048a-eac4-40e1-9173-59f54630dbac	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	oidc-full-name-mapper
ed019488-7560-458a-99da-58f78d2e94df	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
363f00be-cd90-4153-a641-bb2696b89657	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	saml-role-list-mapper
475e637f-f721-4746-b114-347110b44dc8	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b67d6d8f-e3e3-4ef1-aa70-81f61a7d9043	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
60254848-f865-40e1-8c2b-7ffb0e289f85	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	saml-user-property-mapper
b6d1aa6c-a1ee-49af-8848-8cdc0b48e021	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	oidc-address-mapper
b42827a9-a49e-48e0-95ef-250a529fdcf7	81d3d17f-9051-434b-a7ed-6368a5588614	allowed-protocol-mapper-types	saml-user-attribute-mapper
2b81ca35-079e-4f4b-a9ed-c76df1e36996	eb989e1e-5770-4045-9cb0-74ebdff30e89	host-sending-registration-request-must-match	true
a965ec5e-16f2-489e-b57d-7320fe1faf77	eb989e1e-5770-4045-9cb0-74ebdff30e89	client-uris-must-match	true
fe606019-f651-4dcd-be72-cd5f4c395083	eedc66e0-2c8a-4316-ba29-b6b5b25bda84	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	446119ea-5360-4d23-8c17-2f6404d22e32
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	a569ea4f-ced9-4c8c-a36d-6f070493a910
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	7d70ab20-c740-4430-834d-378cb8c25cba
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	6a51a202-3613-42b0-b875-6bfc07059a14
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	41267c00-4d38-4397-bd2d-89bbf0588ac1
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	bd065381-5874-4d00-8da3-6922d753771b
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	b2cebc80-f14d-4a22-b963-514cfef1152e
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	7d13baaa-4a7e-4f34-aa12-a3488414c824
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	b7ed672e-2994-4d67-9188-301a352ca1cc
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	45488893-c768-4ded-a403-6c3ff32baa07
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	889b09f7-4cd2-4923-9253-3f53e3a75915
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	4bb58a4d-cf76-4e77-8c56-052ce3d05eed
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	bf7dda2e-3e48-4377-abea-29d9ae83ebb7
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	45eaaa28-f6eb-45c9-af91-c4f35a7638d0
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	6e10494d-cf2c-4668-9c4e-979d001eab48
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	7eaf63d1-f2a8-4959-b390-148d0754b5fd
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	51caed8f-855a-4cf4-afb5-c3808156db16
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	a5841f41-8fff-4d7e-9a19-682ffbba0607
41267c00-4d38-4397-bd2d-89bbf0588ac1	7eaf63d1-f2a8-4959-b390-148d0754b5fd
6a51a202-3613-42b0-b875-6bfc07059a14	6e10494d-cf2c-4668-9c4e-979d001eab48
6a51a202-3613-42b0-b875-6bfc07059a14	a5841f41-8fff-4d7e-9a19-682ffbba0607
7ac03f7b-9314-480e-8f92-662a609d2b02	b04392ed-e234-4272-bf27-751a847dc777
7ac03f7b-9314-480e-8f92-662a609d2b02	39c17f64-669f-463a-9db3-1da0b95f9efb
39c17f64-669f-463a-9db3-1da0b95f9efb	93e54565-2db4-4368-b012-2d81420fb5cc
a6e29047-d610-47eb-a57b-c2a5ea11adc0	3e900ee3-efd4-45fe-9d5b-d02f2fd237d4
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	7a199701-c451-4f7d-be01-44cd00336e6f
7ac03f7b-9314-480e-8f92-662a609d2b02	ca3eed16-7f5b-480b-9b8b-b08891c3ba5a
7ac03f7b-9314-480e-8f92-662a609d2b02	852585ab-8d79-40b8-aaed-d015ed10969c
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	25b8ef87-9e9b-4b3b-9210-39c679932fb0
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	4423090d-a3ae-4416-8d10-93e3e36860ca
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	21d8f3c8-ad6b-4b86-8757-8f1306c79acc
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	5e60f42f-edcb-4baf-9e6e-3fd82af1bda8
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	3466f3d5-e434-48e4-b4ff-4d183471222b
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	8e5dfc0c-fe8e-44ec-921e-87b9a8a06480
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	e33f0762-23af-4054-8b82-e0082adcb41f
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	a63b0120-433e-42cd-a76a-625cc71da31e
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	d6672c82-686f-461a-a526-9656bc85195a
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	243a8907-6e65-4df2-a1ce-b452dd43669b
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	f9d5f445-ecc5-46ab-bc90-07a3f6439de8
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	425f66de-944f-4894-9c2c-2f5972c7fb82
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	4324ef23-6496-47c4-92d0-ccd7ac1b17bf
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	877690a5-7566-472c-acc7-c118525c609e
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	6dc7e144-2d35-45bc-8cb4-db0e2ece28f7
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	8cf7a3ab-1f71-4bbe-9ca3-f0205e388bde
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	0c0f4e36-0373-49b1-a32f-a5c86c4a244c
21d8f3c8-ad6b-4b86-8757-8f1306c79acc	0c0f4e36-0373-49b1-a32f-a5c86c4a244c
21d8f3c8-ad6b-4b86-8757-8f1306c79acc	877690a5-7566-472c-acc7-c118525c609e
5e60f42f-edcb-4baf-9e6e-3fd82af1bda8	6dc7e144-2d35-45bc-8cb4-db0e2ece28f7
c7922671-32cd-4e11-8715-3da11f33b695	b626a80b-21bb-4ef7-86e3-7ac16fe313f1
c7922671-32cd-4e11-8715-3da11f33b695	9c8e3a9c-3737-478d-9e73-7a837ae23e73
c7922671-32cd-4e11-8715-3da11f33b695	37f7f992-1f7e-448d-a559-9142792e0683
c7922671-32cd-4e11-8715-3da11f33b695	6eb950c6-dc6d-44ee-8029-e0ea425e9a9b
c7922671-32cd-4e11-8715-3da11f33b695	91f4d41b-d6e1-46f1-a50a-d03e6236eeaf
c7922671-32cd-4e11-8715-3da11f33b695	7557b338-7346-4525-893c-138b8452d994
c7922671-32cd-4e11-8715-3da11f33b695	1c60bf5e-9149-4fb1-bcf2-0f746612aec5
c7922671-32cd-4e11-8715-3da11f33b695	f0c17e3d-6122-4639-961b-eb4c00fbdf35
c7922671-32cd-4e11-8715-3da11f33b695	c0c20044-d6e9-417d-a10d-691bc0b609b0
c7922671-32cd-4e11-8715-3da11f33b695	3a508fcb-5d2e-4e3a-8b76-fa543772909d
c7922671-32cd-4e11-8715-3da11f33b695	a95fe4a2-3a24-4cb8-8a56-cc8500b6fa03
c7922671-32cd-4e11-8715-3da11f33b695	d418925b-997e-4085-a71e-9b65462a90c0
c7922671-32cd-4e11-8715-3da11f33b695	13e91548-7677-4e37-98d0-75f9936a50fb
c7922671-32cd-4e11-8715-3da11f33b695	57ba2367-8bfb-40ed-bf17-d83781af1962
c7922671-32cd-4e11-8715-3da11f33b695	b3baf288-2351-4725-9f14-7bea8c62814a
c7922671-32cd-4e11-8715-3da11f33b695	8f822061-daf1-4747-adc0-ab8f985ec4b9
c7922671-32cd-4e11-8715-3da11f33b695	fdcc5e0c-ce15-487c-9b37-fcdd3e9890d0
37f7f992-1f7e-448d-a559-9142792e0683	fdcc5e0c-ce15-487c-9b37-fcdd3e9890d0
37f7f992-1f7e-448d-a559-9142792e0683	57ba2367-8bfb-40ed-bf17-d83781af1962
6eb950c6-dc6d-44ee-8029-e0ea425e9a9b	b3baf288-2351-4725-9f14-7bea8c62814a
ef2bd23d-2004-4a32-b640-6fdddf908922	9861fdb7-c7cd-4355-b58c-0783904c4252
ef2bd23d-2004-4a32-b640-6fdddf908922	90f71f02-f518-4db2-9911-cf23e3b3d148
90f71f02-f518-4db2-9911-cf23e3b3d148	9a540eb3-b764-445a-b5e9-1862d6204708
d635c525-861d-44f6-9c7e-3d2b770aeae1	0aff9b87-c93f-4127-8d91-ed8f55d01a08
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	8cdd2500-7fbd-4498-88e9-2e259cb18c57
c7922671-32cd-4e11-8715-3da11f33b695	a76004cd-5583-4668-95c1-1539b3b20510
ef2bd23d-2004-4a32-b640-6fdddf908922	962f9915-967b-4dd8-b0d7-873a90f103d4
ef2bd23d-2004-4a32-b640-6fdddf908922	b3f0dbe2-f370-49c9-936b-d4781cb2ad41
ef2bd23d-2004-4a32-b640-6fdddf908922	0cad0ae8-957a-4612-8224-52e05491e664
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
0a0fe3b5-36ba-4ebe-9cce-ccde1e60479b	\N	password	85db544d-b136-4a5c-9b63-cb044e833cfd	1748892331774	My password	{"value":"M24zSCTgXT5/usueBg7ubX3DsLtx+ECaepi2kHyypJ0=","salt":"SBl8420Pgd92UCx2LwfjCw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
e0bab9da-931d-4122-bfa8-d1389ee4a03c	\N	password	f0d998a2-db2d-47ea-8d84-022ea6249eec	1748892889513	\N	{"value":"p9Vgt3rthXzUK7l+FbnA+neg2ZZVwvF+vab3Dx675Ts=","salt":"xFZyMHDAqoxp+g39p7k7tg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-06-02 22:16:18.810236	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8891778055
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-06-02 22:16:18.84487	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	8891778055
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-06-02 22:16:18.920333	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	8891778055
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-06-02 22:16:18.928417	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8891778055
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-06-02 22:16:19.101613	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8891778055
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-06-02 22:16:19.11499	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	8891778055
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-06-02 22:16:19.291419	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8891778055
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-06-02 22:16:19.300137	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	8891778055
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-06-02 22:16:19.311302	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	8891778055
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-06-02 22:16:19.466148	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	8891778055
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-06-02 22:16:19.554176	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8891778055
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-06-02 22:16:19.56339	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8891778055
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-06-02 22:16:19.597914	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	8891778055
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-02 22:16:19.627249	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	8891778055
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-02 22:16:19.629609	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-02 22:16:19.633516	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	8891778055
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-02 22:16:19.637634	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	8891778055
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-06-02 22:16:19.701809	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	8891778055
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-06-02 22:16:19.761142	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8891778055
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-06-02 22:16:19.768919	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8891778055
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-06-02 22:16:19.77381	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	8891778055
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-06-02 22:16:19.777964	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	8891778055
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-06-02 22:16:19.920114	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	8891778055
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-06-02 22:16:19.929363	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8891778055
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-06-02 22:16:19.931853	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	8891778055
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-06-02 22:16:20.693777	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	8891778055
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-06-02 22:16:20.794572	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	8891778055
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-06-02 22:16:20.79941	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8891778055
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-06-02 22:16:20.884673	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	8891778055
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-06-02 22:16:20.901518	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	8891778055
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-06-02 22:16:20.923288	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	8891778055
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-06-02 22:16:20.929545	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	8891778055
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-02 22:16:20.937082	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-02 22:16:20.940218	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8891778055
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-02 22:16:20.976407	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	8891778055
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-06-02 22:16:20.982795	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	8891778055
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-02 22:16:20.989876	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8891778055
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-06-02 22:16:20.99493	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	8891778055
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-06-02 22:16:20.999486	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	8891778055
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-02 22:16:21.001516	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8891778055
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-02 22:16:21.004264	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	8891778055
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-06-02 22:16:21.010403	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	8891778055
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-02 22:16:23.776619	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	8891778055
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-06-02 22:16:23.781079	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	8891778055
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-02 22:16:23.786216	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8891778055
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-02 22:16:23.790736	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	8891778055
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-02 22:16:23.792493	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	8891778055
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-02 22:16:23.983259	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	8891778055
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-02 22:16:23.988602	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	8891778055
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-06-02 22:16:24.036519	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	8891778055
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-06-02 22:16:24.623727	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	8891778055
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-06-02 22:16:24.628224	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-06-02 22:16:24.63164	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	8891778055
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-06-02 22:16:24.635077	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	8891778055
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-02 22:16:24.64309	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	8891778055
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-02 22:16:24.648624	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	8891778055
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-02 22:16:24.727114	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	8891778055
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-02 22:16:25.323237	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	8891778055
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-06-02 22:16:25.353664	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	8891778055
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-06-02 22:16:25.360156	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	8891778055
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-06-02 22:16:25.368485	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	8891778055
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-06-02 22:16:25.374993	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	8891778055
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-06-02 22:16:25.37927	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8891778055
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-06-02 22:16:25.382694	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	8891778055
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-06-02 22:16:25.386008	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	8891778055
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-06-02 22:16:25.45162	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	8891778055
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-06-02 22:16:25.509872	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	8891778055
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-06-02 22:16:25.516004	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	8891778055
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-06-02 22:16:25.577158	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	8891778055
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-06-02 22:16:25.583809	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	8891778055
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-06-02 22:16:25.588418	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8891778055
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-02 22:16:25.596388	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8891778055
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-02 22:16:25.604283	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8891778055
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-02 22:16:25.606678	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	8891778055
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-02 22:16:25.62719	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	8891778055
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-02 22:16:25.688093	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	8891778055
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-02 22:16:25.693168	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	8891778055
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-02 22:16:25.695192	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	8891778055
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-02 22:16:25.71784	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	8891778055
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-02 22:16:25.720455	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	8891778055
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-02 22:16:25.778907	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	8891778055
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-02 22:16:25.780787	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8891778055
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-02 22:16:25.786506	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8891778055
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-02 22:16:25.788394	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	8891778055
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-02 22:16:25.845208	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8891778055
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-06-02 22:16:25.850076	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	8891778055
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-06-02 22:16:25.857063	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	8891778055
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-06-02 22:16:25.867131	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	8891778055
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.872846	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	8891778055
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.878619	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	8891778055
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.933507	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.941265	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	8891778055
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.943164	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8891778055
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.952539	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	8891778055
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.95464	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	8891778055
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-02 22:16:25.9612	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	8891778055
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.120302	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.122252	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.132507	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.194241	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.196402	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.270009	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	8891778055
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-02 22:16:26.274779	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	8891778055
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-06-02 22:16:26.281832	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	8891778055
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-06-02 22:16:26.339598	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	8891778055
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-06-02 22:16:26.398822	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8891778055
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-06-02 22:16:26.460268	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	8891778055
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-06-02 22:16:26.46481	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	8891778055
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-02 22:16:26.520311	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8891778055
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-02 22:16:26.522279	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	8891778055
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-02 22:16:26.529532	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-06-02 22:16:26.534037	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	8891778055
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-06-02 22:16:26.562989	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	8891778055
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-06-02 22:16:26.565456	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	8891778055
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-06-02 22:16:26.570233	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	8891778055
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-06-02 22:16:26.571802	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	8891778055
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-06-02 22:16:26.577919	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	8891778055
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-06-02 22:16:26.581566	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	8891778055
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-02 22:16:26.800763	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	8891778055
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-02 22:16:26.806221	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	8891778055
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-02 22:16:26.813313	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-02 22:16:26.87314	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-02 22:16:26.878101	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	8891778055
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-02 22:16:26.87991	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-02 22:16:26.882387	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:26.890096	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:26.950349	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.18147	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.41284	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.649602	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.867795	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.870108	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.93958	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	8891778055
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.962616	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8891778055
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.975992	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8891778055
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:27.978061	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	8891778055
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-02 22:16:28.099827	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	8891778055
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.108257	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	8891778055
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.116043	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	8891778055
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.174951	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	8891778055
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.181385	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	8891778055
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.1897	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8891778055
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.279491	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	8891778055
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.404279	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	8891778055
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.609401	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	8891778055
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.621687	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	8891778055
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-02 22:16:28.625634	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	8891778055
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-02 22:16:28.636232	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	8891778055
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-02 22:16:28.644073	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	8891778055
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-02 22:16:28.648103	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	8891778055
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-06-02 22:16:28.657727	151	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.29.1	\N	\N	8891778055
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-06-02 22:16:28.661967	152	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.29.1	\N	\N	8891778055
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
a03a5306-1fa8-4e80-a095-103e9f150252	735b5041-cf2d-41d2-b952-962ad1f6e8c9	f
a03a5306-1fa8-4e80-a095-103e9f150252	78b1a598-4032-4af4-b5b5-f106050b02c6	t
a03a5306-1fa8-4e80-a095-103e9f150252	afae1287-ca54-4d89-944e-8eb2f722c366	t
a03a5306-1fa8-4e80-a095-103e9f150252	e7657ce3-dd29-4079-bcef-0996e4d24216	t
a03a5306-1fa8-4e80-a095-103e9f150252	8fcbde4b-3469-4c70-8be5-26bef75244d6	t
a03a5306-1fa8-4e80-a095-103e9f150252	361fb528-9380-4965-b6ec-54d63e588721	f
a03a5306-1fa8-4e80-a095-103e9f150252	4fb30195-1386-4bef-ae48-5c2a89513364	f
a03a5306-1fa8-4e80-a095-103e9f150252	06227a4f-b49e-4298-a084-cd33d77fe168	t
a03a5306-1fa8-4e80-a095-103e9f150252	03844f51-f57d-4218-9fb0-e42e0b530222	t
a03a5306-1fa8-4e80-a095-103e9f150252	d43aafb4-6442-4037-a900-4f5ec05d7f6b	f
a03a5306-1fa8-4e80-a095-103e9f150252	09272df3-c36a-4f73-b6c2-321368cffc2b	t
a03a5306-1fa8-4e80-a095-103e9f150252	c133bf0f-9de2-4f85-a773-f0f17ac43f21	t
a03a5306-1fa8-4e80-a095-103e9f150252	3b078ae4-540f-43e3-8a6c-b8043b0bc58e	f
2b2b321a-629d-48cd-a065-806aca97437e	cc552e0e-75a3-4248-9294-05bbf24907c5	f
2b2b321a-629d-48cd-a065-806aca97437e	a84bc83c-78b7-49d5-97b8-86c0c747991d	t
2b2b321a-629d-48cd-a065-806aca97437e	4ab4bb65-bd10-408d-8b13-36e1fe495ec2	t
2b2b321a-629d-48cd-a065-806aca97437e	04e9cc6b-62b9-4e92-b75d-5e25a5d88469	t
2b2b321a-629d-48cd-a065-806aca97437e	3d158b09-68cd-4aed-9b4e-602ff6a04c2f	t
2b2b321a-629d-48cd-a065-806aca97437e	7b93052a-49f9-4b9a-86f7-14971d17c419	f
2b2b321a-629d-48cd-a065-806aca97437e	7e8d0f86-8acc-4e23-b2e9-e38ab4540375	f
2b2b321a-629d-48cd-a065-806aca97437e	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087	t
2b2b321a-629d-48cd-a065-806aca97437e	3a771edb-6aa0-4b55-acc3-8127ff9c83da	t
2b2b321a-629d-48cd-a065-806aca97437e	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53	f
2b2b321a-629d-48cd-a065-806aca97437e	3b614f98-c24c-4953-9d65-4b1fe3dc8283	t
2b2b321a-629d-48cd-a065-806aca97437e	893bd505-8615-492d-ba4e-210bbdca498c	t
2b2b321a-629d-48cd-a065-806aca97437e	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
google	2b2b321a-629d-48cd-a065-806aca97437e	111867034000059275904	cebotarenkodima@gmail.com	\N	f0d998a2-db2d-47ea-8d84-022ea6249eec
github	2b2b321a-629d-48cd-a065-806aca97437e	128312523	dmitryzser	\N	f0d998a2-db2d-47ea-8d84-022ea6249eec
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
e7f1f2a7-e6dc-4d39-b3a9-ca332ea5bf14	a2ce6574-c838-4d00-9c36-97f4301e4c00
eff38da4-7d25-4dda-9a67-b2f2954fd87a	a2ce6574-c838-4d00-9c36-97f4301e4c00
b184b405-9a28-4478-8296-4d6f479f1339	a2ce6574-c838-4d00-9c36-97f4301e4c00
0c5d11b9-711d-4bed-95f2-e1ab355f7195	349d666d-df1b-4997-a2f7-322bcd3b2174
e7f1f2a7-e6dc-4d39-b3a9-ca332ea5bf14	bc41215d-a6ba-4c80-871d-93cee3f74d46
eff38da4-7d25-4dda-9a67-b2f2954fd87a	0c0b1126-5ed1-43e7-87f1-6eb70c42e871
ef2bd23d-2004-4a32-b640-6fdddf908922	423448b1-df9a-446b-96e4-4658912ef48d
0cad0ae8-957a-4612-8224-52e05491e664	423448b1-df9a-446b-96e4-4658912ef48d
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
c70efcda-45bc-46dc-b017-6cb119c001db	t	google	google	f	f	2b2b321a-629d-48cd-a065-806aca97437e	f	f	\N	\N		f	\N	f
83f456d0-678c-4610-a4b8-4a9be4e887ff	t	github	github	f	f	2b2b321a-629d-48cd-a065-806aca97437e	f	f	\N	\N		f	\N	f
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
c70efcda-45bc-46dc-b017-6cb119c001db	1090077236524-p78gtgv8ajfqu3tu0ct57kochjqlukdk.apps.googleusercontent.com	clientId
c70efcda-45bc-46dc-b017-6cb119c001db	false	acceptsPromptNoneForwardFromClient
c70efcda-45bc-46dc-b017-6cb119c001db	false	disableUserInfo
c70efcda-45bc-46dc-b017-6cb119c001db	LEGACY	syncMode
c70efcda-45bc-46dc-b017-6cb119c001db	false	filteredByClaim
c70efcda-45bc-46dc-b017-6cb119c001db	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	clientSecret
c70efcda-45bc-46dc-b017-6cb119c001db	false	caseSensitiveOriginalUsername
83f456d0-678c-4610-a4b8-4a9be4e887ff	Ov23liBu4ccgv4rPmxtM	clientId
83f456d0-678c-4610-a4b8-4a9be4e887ff	false	acceptsPromptNoneForwardFromClient
83f456d0-678c-4610-a4b8-4a9be4e887ff	false	disableUserInfo
83f456d0-678c-4610-a4b8-4a9be4e887ff	LEGACY	syncMode
83f456d0-678c-4610-a4b8-4a9be4e887ff	false	filteredByClaim
83f456d0-678c-4610-a4b8-4a9be4e887ff	5cd1dbdbadcf0e39d660fddb0f6df2e1fa86b90b	clientSecret
83f456d0-678c-4610-a4b8-4a9be4e887ff	false	caseSensitiveOriginalUsername
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
349d666d-df1b-4997-a2f7-322bcd3b2174	Administration	 	2b2b321a-629d-48cd-a065-806aca97437e	0
0c0b1126-5ed1-43e7-87f1-6eb70c42e871	Creators	 	2b2b321a-629d-48cd-a065-806aca97437e	0
423448b1-df9a-446b-96e4-4658912ef48d	Users	 	2b2b321a-629d-48cd-a065-806aca97437e	0
ab33ef8a-3379-46f1-9799-94f5a5c1cee8	Moderators	349d666d-df1b-4997-a2f7-322bcd3b2174	2b2b321a-629d-48cd-a065-806aca97437e	0
bc41215d-a6ba-4c80-871d-93cee3f74d46	Administrators	349d666d-df1b-4997-a2f7-322bcd3b2174	2b2b321a-629d-48cd-a065-806aca97437e	0
a2ce6574-c838-4d00-9c36-97f4301e4c00	SEO	349d666d-df1b-4997-a2f7-322bcd3b2174	2b2b321a-629d-48cd-a065-806aca97437e	0
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
7ac03f7b-9314-480e-8f92-662a609d2b02	a03a5306-1fa8-4e80-a095-103e9f150252	f	${role_default-roles}	default-roles-master	a03a5306-1fa8-4e80-a095-103e9f150252	\N	\N
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	a03a5306-1fa8-4e80-a095-103e9f150252	f	${role_admin}	admin	a03a5306-1fa8-4e80-a095-103e9f150252	\N	\N
446119ea-5360-4d23-8c17-2f6404d22e32	a03a5306-1fa8-4e80-a095-103e9f150252	f	${role_create-realm}	create-realm	a03a5306-1fa8-4e80-a095-103e9f150252	\N	\N
a569ea4f-ced9-4c8c-a36d-6f070493a910	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_create-client}	create-client	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
7d70ab20-c740-4430-834d-378cb8c25cba	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-realm}	view-realm	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
6a51a202-3613-42b0-b875-6bfc07059a14	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-users}	view-users	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
41267c00-4d38-4397-bd2d-89bbf0588ac1	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-clients}	view-clients	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
bd065381-5874-4d00-8da3-6922d753771b	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-events}	view-events	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
b2cebc80-f14d-4a22-b963-514cfef1152e	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-identity-providers}	view-identity-providers	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
7d13baaa-4a7e-4f34-aa12-a3488414c824	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_view-authorization}	view-authorization	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
b7ed672e-2994-4d67-9188-301a352ca1cc	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-realm}	manage-realm	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
45488893-c768-4ded-a403-6c3ff32baa07	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-users}	manage-users	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
889b09f7-4cd2-4923-9253-3f53e3a75915	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-clients}	manage-clients	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
4bb58a4d-cf76-4e77-8c56-052ce3d05eed	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-events}	manage-events	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
bf7dda2e-3e48-4377-abea-29d9ae83ebb7	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-identity-providers}	manage-identity-providers	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
45eaaa28-f6eb-45c9-af91-c4f35a7638d0	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_manage-authorization}	manage-authorization	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
6e10494d-cf2c-4668-9c4e-979d001eab48	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_query-users}	query-users	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
7eaf63d1-f2a8-4959-b390-148d0754b5fd	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_query-clients}	query-clients	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
51caed8f-855a-4cf4-afb5-c3808156db16	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_query-realms}	query-realms	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
a5841f41-8fff-4d7e-9a19-682ffbba0607	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_query-groups}	query-groups	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
b04392ed-e234-4272-bf27-751a847dc777	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_view-profile}	view-profile	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
39c17f64-669f-463a-9db3-1da0b95f9efb	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_manage-account}	manage-account	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
93e54565-2db4-4368-b012-2d81420fb5cc	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_manage-account-links}	manage-account-links	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
dbe90b4a-b103-40d3-a069-f13b9d5642c8	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_view-applications}	view-applications	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
3e900ee3-efd4-45fe-9d5b-d02f2fd237d4	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_view-consent}	view-consent	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
a6e29047-d610-47eb-a57b-c2a5ea11adc0	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_manage-consent}	manage-consent	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
099f9edc-dc02-4b53-823c-9cb7a4def95b	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_view-groups}	view-groups	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
210413db-bae7-46a3-b6f1-f1d9e911fc14	117ec0a4-3700-45dd-8142-eb1835f74494	t	${role_delete-account}	delete-account	a03a5306-1fa8-4e80-a095-103e9f150252	117ec0a4-3700-45dd-8142-eb1835f74494	\N
9a6191ba-aa9a-4f1d-84cd-614c79c878c7	12deceff-00d7-4df2-8ed2-e678ac8e62ae	t	${role_read-token}	read-token	a03a5306-1fa8-4e80-a095-103e9f150252	12deceff-00d7-4df2-8ed2-e678ac8e62ae	\N
7a199701-c451-4f7d-be01-44cd00336e6f	7d6b4c8e-f047-49a5-8671-d38d62e9944c	t	${role_impersonation}	impersonation	a03a5306-1fa8-4e80-a095-103e9f150252	7d6b4c8e-f047-49a5-8671-d38d62e9944c	\N
ca3eed16-7f5b-480b-9b8b-b08891c3ba5a	a03a5306-1fa8-4e80-a095-103e9f150252	f	${role_offline-access}	offline_access	a03a5306-1fa8-4e80-a095-103e9f150252	\N	\N
852585ab-8d79-40b8-aaed-d015ed10969c	a03a5306-1fa8-4e80-a095-103e9f150252	f	${role_uma_authorization}	uma_authorization	a03a5306-1fa8-4e80-a095-103e9f150252	\N	\N
ef2bd23d-2004-4a32-b640-6fdddf908922	2b2b321a-629d-48cd-a065-806aca97437e	f	${role_default-roles}	default-roles-infozhur	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
25b8ef87-9e9b-4b3b-9210-39c679932fb0	54444296-874f-4a02-ab26-3c1263f65609	t	${role_create-client}	create-client	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
4423090d-a3ae-4416-8d10-93e3e36860ca	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-realm}	view-realm	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
21d8f3c8-ad6b-4b86-8757-8f1306c79acc	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-users}	view-users	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
5e60f42f-edcb-4baf-9e6e-3fd82af1bda8	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-clients}	view-clients	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
3466f3d5-e434-48e4-b4ff-4d183471222b	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-events}	view-events	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
8e5dfc0c-fe8e-44ec-921e-87b9a8a06480	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-identity-providers}	view-identity-providers	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
e33f0762-23af-4054-8b82-e0082adcb41f	54444296-874f-4a02-ab26-3c1263f65609	t	${role_view-authorization}	view-authorization	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
a63b0120-433e-42cd-a76a-625cc71da31e	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-realm}	manage-realm	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
d6672c82-686f-461a-a526-9656bc85195a	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-users}	manage-users	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
243a8907-6e65-4df2-a1ce-b452dd43669b	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-clients}	manage-clients	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
f9d5f445-ecc5-46ab-bc90-07a3f6439de8	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-events}	manage-events	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
425f66de-944f-4894-9c2c-2f5972c7fb82	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-identity-providers}	manage-identity-providers	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
4324ef23-6496-47c4-92d0-ccd7ac1b17bf	54444296-874f-4a02-ab26-3c1263f65609	t	${role_manage-authorization}	manage-authorization	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
877690a5-7566-472c-acc7-c118525c609e	54444296-874f-4a02-ab26-3c1263f65609	t	${role_query-users}	query-users	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
6dc7e144-2d35-45bc-8cb4-db0e2ece28f7	54444296-874f-4a02-ab26-3c1263f65609	t	${role_query-clients}	query-clients	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
8cf7a3ab-1f71-4bbe-9ca3-f0205e388bde	54444296-874f-4a02-ab26-3c1263f65609	t	${role_query-realms}	query-realms	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
0c0f4e36-0373-49b1-a32f-a5c86c4a244c	54444296-874f-4a02-ab26-3c1263f65609	t	${role_query-groups}	query-groups	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
c7922671-32cd-4e11-8715-3da11f33b695	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_realm-admin}	realm-admin	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
b626a80b-21bb-4ef7-86e3-7ac16fe313f1	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_create-client}	create-client	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
9c8e3a9c-3737-478d-9e73-7a837ae23e73	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-realm}	view-realm	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
37f7f992-1f7e-448d-a559-9142792e0683	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-users}	view-users	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
6eb950c6-dc6d-44ee-8029-e0ea425e9a9b	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-clients}	view-clients	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
91f4d41b-d6e1-46f1-a50a-d03e6236eeaf	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-events}	view-events	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
7557b338-7346-4525-893c-138b8452d994	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-identity-providers}	view-identity-providers	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
1c60bf5e-9149-4fb1-bcf2-0f746612aec5	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_view-authorization}	view-authorization	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
f0c17e3d-6122-4639-961b-eb4c00fbdf35	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-realm}	manage-realm	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
c0c20044-d6e9-417d-a10d-691bc0b609b0	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-users}	manage-users	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
3a508fcb-5d2e-4e3a-8b76-fa543772909d	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-clients}	manage-clients	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
a95fe4a2-3a24-4cb8-8a56-cc8500b6fa03	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-events}	manage-events	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
d418925b-997e-4085-a71e-9b65462a90c0	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-identity-providers}	manage-identity-providers	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
13e91548-7677-4e37-98d0-75f9936a50fb	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_manage-authorization}	manage-authorization	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
57ba2367-8bfb-40ed-bf17-d83781af1962	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_query-users}	query-users	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
b3baf288-2351-4725-9f14-7bea8c62814a	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_query-clients}	query-clients	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
8f822061-daf1-4747-adc0-ab8f985ec4b9	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_query-realms}	query-realms	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
fdcc5e0c-ce15-487c-9b37-fcdd3e9890d0	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_query-groups}	query-groups	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
9861fdb7-c7cd-4355-b58c-0783904c4252	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_view-profile}	view-profile	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
90f71f02-f518-4db2-9911-cf23e3b3d148	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_manage-account}	manage-account	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
9a540eb3-b764-445a-b5e9-1862d6204708	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_manage-account-links}	manage-account-links	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
9d3c6954-0dad-4f3c-b670-714d2f7f48c0	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_view-applications}	view-applications	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
0aff9b87-c93f-4127-8d91-ed8f55d01a08	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_view-consent}	view-consent	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
d635c525-861d-44f6-9c7e-3d2b770aeae1	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_manage-consent}	manage-consent	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
0f49b79d-bc00-43ec-865c-250ed2e9b713	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_view-groups}	view-groups	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
28363fd0-e3b9-48ae-b006-f994e1efb1f5	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	t	${role_delete-account}	delete-account	2b2b321a-629d-48cd-a065-806aca97437e	2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	\N
8cdd2500-7fbd-4498-88e9-2e259cb18c57	54444296-874f-4a02-ab26-3c1263f65609	t	${role_impersonation}	impersonation	a03a5306-1fa8-4e80-a095-103e9f150252	54444296-874f-4a02-ab26-3c1263f65609	\N
a76004cd-5583-4668-95c1-1539b3b20510	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	t	${role_impersonation}	impersonation	2b2b321a-629d-48cd-a065-806aca97437e	6b25ca04-2b23-4ccd-89ee-39b148a7ddac	\N
184f201c-5c49-4a4c-b612-5a346fe7ff7d	b62b5819-af78-4c2a-87ad-8a7456b6b4ab	t	${role_read-token}	read-token	2b2b321a-629d-48cd-a065-806aca97437e	b62b5819-af78-4c2a-87ad-8a7456b6b4ab	\N
962f9915-967b-4dd8-b0d7-873a90f103d4	2b2b321a-629d-48cd-a065-806aca97437e	f	${role_offline-access}	offline_access	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
b3f0dbe2-f370-49c9-936b-d4781cb2ad41	2b2b321a-629d-48cd-a065-806aca97437e	f	${role_uma_authorization}	uma_authorization	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
e7f1f2a7-e6dc-4d39-b3a9-ca332ea5bf14	2b2b321a-629d-48cd-a065-806aca97437e	f	Администратор	Administrator	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
0c5d11b9-711d-4bed-95f2-e1ab355f7195	2b2b321a-629d-48cd-a065-806aca97437e	f	Модератор	Moderator	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
b184b405-9a28-4478-8296-4d6f479f1339	2b2b321a-629d-48cd-a065-806aca97437e	f	SEOSEOSEO	SEO	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
eff38da4-7d25-4dda-9a67-b2f2954fd87a	2b2b321a-629d-48cd-a065-806aca97437e	f	Автор статей, писатель	Creator	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
0cad0ae8-957a-4612-8224-52e05491e664	2b2b321a-629d-48cd-a065-806aca97437e	f	Рядовой пользователь	User	2b2b321a-629d-48cd-a065-806aca97437e	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
jrtta	26.2.4	1748891789
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
7b65f98e-755a-476d-b630-4ae6de95a9b3	bb02fd1e-5d55-4c51-813a-64767c0b59b8	0	1748893730	{"authMethod":"openid-connect","redirectUri":"http://localhost:3000/silent-check-sso.html","notes":{"clientId":"bb02fd1e-5d55-4c51-813a-64767c0b59b8","userSessionRememberMe":"true","iss":"http://localhost:8080/realms/infozhur","startedAt":"1748893120","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"9975d3cf-90a0-4558-a123-13ed9ee1bc2d","response_mode":"fragment","scope":"openid","userSessionStartedAt":"1748893120","redirect_uri":"http://localhost:3000/silent-check-sso.html","state":"b0eb7744-1c56-4d8d-81df-636c9ba1496a","code_challenge":"5GCTQiLpREtRueDC9bCLcdZl3dN1-dExBhjBSpvmjlg","prompt":"none","SSO_AUTH":"true"}}	local	local	8
f9abe563-99c9-4d9c-9abc-3709557a5184	5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	0	1748893690	{"authMethod":"openid-connect","redirectUri":"http://127.0.0.1:8080/admin/master/console/#/master/users/add-user","notes":{"clientId":"5a4bb5c5-bef3-4247-9d91-f3b6c5f17820","iss":"http://127.0.0.1:8080/realms/master","startedAt":"1748892358","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"1dac54bd-72d5-4809-83f7-dd52a870ce30","response_mode":"query","scope":"openid","userSessionStartedAt":"1748892358","redirect_uri":"http://127.0.0.1:8080/admin/master/console/#/master/users/add-user","state":"c9513689-2311-4bed-86f3-eb5a7727f460","code_challenge":"w80KYl206amJpkQdBBKArOqABZWzcyYuGIOEN7glKLo"}}	local	local	15
7b65f98e-755a-476d-b630-4ae6de95a9b3	08d131cd-0552-48c8-9846-9df64a4f58aa	0	1748893130	{"authMethod":"openid-connect","redirectUri":"http://localhost:8080/realms/infozhur/account/account-security/linked-accounts","notes":{"clientId":"08d131cd-0552-48c8-9846-9df64a4f58aa","userSessionRememberMe":"true","iss":"http://localhost:8080/realms/infozhur","startedAt":"1748893121","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"9e0484dd-0ebf-4251-8579-a86560fbd7d0","response_mode":"query","scope":"openid","SSO_AUTH":"true","userSessionStartedAt":"1748893120","redirect_uri":"http://localhost:8080/realms/infozhur/account/account-security/linked-accounts","state":"2e83e095-bb86-4995-8a7d-bbfef7567503","code_challenge":"SC0PZrQfwI4jmlfoKJWuiLajvEFOk5rhMxPc2ptf8XE","prompt":"none"}}	local	local	4
23c74421-e679-4b8f-b8c5-d9a8e17673d6	5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	0	1748893140	{"authMethod":"openid-connect","redirectUri":"http://localhost:8080/admin/master/console/","notes":{"clientId":"5a4bb5c5-bef3-4247-9d91-f3b6c5f17820","iss":"http://localhost:8080/realms/master","startedAt":"1748893140","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"29f9edce-c32f-4462-82f8-5396c75e131b","response_mode":"query","scope":"openid","userSessionStartedAt":"1748893140","redirect_uri":"http://localhost:8080/admin/master/console/","state":"3b04e7e3-cd96-48f2-9f48-45350e390a0b","code_challenge":"_2e5OWqT0cEDKVj-Pbi99Jbc8K_C9csGWannOZaRtIY"}}	local	local	0
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
23c74421-e679-4b8f-b8c5-d9a8e17673d6	85db544d-b136-4a5c-9b63-cb044e833cfd	a03a5306-1fa8-4e80-a095-103e9f150252	1748893140	0	{"ipAddress":"127.0.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjcuMC4wLjEiLCJvcyI6IlVidW50dSIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiRmlyZWZveC8xMzkuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1748893140","authenticators-completed":"{\\"019f6ab0-96a5-4250-84cc-68c66ec9e001\\":1748893140}"},"state":"LOGGED_IN"}	1748893140	\N	0
f9abe563-99c9-4d9c-9abc-3709557a5184	85db544d-b136-4a5c-9b63-cb044e833cfd	a03a5306-1fa8-4e80-a095-103e9f150252	1748892358	0	{"ipAddress":"127.0.0.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjcuMC4wLjEiLCJvcyI6IlVidW50dSIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiRmlyZWZveC8xMzkuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1748892358","authenticators-completed":"{\\"019f6ab0-96a5-4250-84cc-68c66ec9e001\\":1748892358}"},"state":"LOGGED_IN"}	1748893690	\N	15
7b65f98e-755a-476d-b630-4ae6de95a9b3	f0d998a2-db2d-47ea-8d84-022ea6249eec	2b2b321a-629d-48cd-a065-806aca97437e	1748893120	0	{"ipAddress":"127.0.0.1","authMethod":"openid-connect","rememberMe":true,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjcuMC4wLjEiLCJvcyI6IlVidW50dSIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiRmlyZWZveC8xMzkuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1748893120","authenticators-completed":"{\\"2474aa52-7d11-4464-bf28-638fa6257c48\\":1748893120,\\"a6d29fd0-2eac-4c2d-ba31-76ed43626a56\\":1748893729}","FEDERATED_ACCESS_TOKEN":"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","identity_provider":"github","identity_provider_identity":"dmitryzser"},"state":"LOGGED_IN"}	1748893730	\N	23
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
00dac5d5-2166-4651-add7-84d7fffa1a34	audience resolve	openid-connect	oidc-audience-resolve-mapper	6c4ad828-794d-4384-b0ee-944d9602d13c	\N
afe34553-2c50-4dcb-aa5b-dc38245835c1	locale	openid-connect	oidc-usermodel-attribute-mapper	5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	\N
e2b6f5f1-67e7-42f8-88af-53a771631c1e	role list	saml	saml-role-list-mapper	\N	78b1a598-4032-4af4-b5b5-f106050b02c6
e6bdfde5-a5a0-430c-84f1-ff598f54dff0	organization	saml	saml-organization-membership-mapper	\N	afae1287-ca54-4d89-944e-8eb2f722c366
22fc86bf-b716-419a-a653-c830a357f8e2	full name	openid-connect	oidc-full-name-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
d7f2a2b3-63f8-4046-b21c-65b6eee01181	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
aae94480-0735-4dd7-be49-efa54bfd9957	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
bd88fdd9-10bd-43c2-bf8a-370e311fd866	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
92a39aff-786c-47db-a495-779b1486f08c	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
4215f913-6ab5-4566-8136-676bd7f88f3c	username	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
0a95ec3f-608c-4c8b-aa8c-78612bd08158	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
7f68732c-d4d1-4c6b-975d-360160dc462e	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
1404df6a-d1ff-45bb-b875-79ef61a1292c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
e9db0349-0569-4ffe-85f4-d4227ac12b2d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
f50be48c-a08a-4cb0-b818-25482d63b157	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
fea2f411-f878-4a78-96f5-ca92eaf4a154	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e7657ce3-dd29-4079-bcef-0996e4d24216
2978ba67-031b-4771-af23-07b2363c34f8	email	openid-connect	oidc-usermodel-attribute-mapper	\N	8fcbde4b-3469-4c70-8be5-26bef75244d6
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	email verified	openid-connect	oidc-usermodel-property-mapper	\N	8fcbde4b-3469-4c70-8be5-26bef75244d6
7e440bf9-29c0-4247-b69a-6abbe042201e	address	openid-connect	oidc-address-mapper	\N	361fb528-9380-4965-b6ec-54d63e588721
190549c1-bc96-4785-9f9e-2139825fa483	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	4fb30195-1386-4bef-ae48-5c2a89513364
8fe09873-6bbf-4407-ba72-9519dcefc2d6	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	4fb30195-1386-4bef-ae48-5c2a89513364
b6233d4e-b863-48bd-9ad8-27d4909855b2	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	06227a4f-b49e-4298-a084-cd33d77fe168
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	06227a4f-b49e-4298-a084-cd33d77fe168
bfbf0574-6efb-49ca-8ba1-dc970e66a81f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	06227a4f-b49e-4298-a084-cd33d77fe168
488fc1b2-600b-4af3-a270-1dd3a9d09430	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	03844f51-f57d-4218-9fb0-e42e0b530222
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	d43aafb4-6442-4037-a900-4f5ec05d7f6b
16709dfa-381f-4b13-8f6b-af943790f850	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	d43aafb4-6442-4037-a900-4f5ec05d7f6b
6bc88524-68b1-444f-b76f-0b6aba5d6931	acr loa level	openid-connect	oidc-acr-mapper	\N	09272df3-c36a-4f73-b6c2-321368cffc2b
5262d800-43bf-45a1-9bfc-fbe822ed5722	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	c133bf0f-9de2-4f85-a773-f0f17ac43f21
d61d2a3e-9dc5-4f2c-a395-8ed0c32a079a	sub	openid-connect	oidc-sub-mapper	\N	c133bf0f-9de2-4f85-a773-f0f17ac43f21
ec717c4b-6cf1-463a-a91a-e12ebd02d591	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	3905a7cf-5b1a-4ef3-8423-c6d19f8b0420
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	3905a7cf-5b1a-4ef3-8423-c6d19f8b0420
fdde767a-4165-4458-a22b-a62a59d1fa56	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	3905a7cf-5b1a-4ef3-8423-c6d19f8b0420
d01b7785-56fa-48e9-9d55-7a8a037db52b	organization	openid-connect	oidc-organization-membership-mapper	\N	3b078ae4-540f-43e3-8a6c-b8043b0bc58e
3e78bdde-c7d4-48a3-8b85-77c791e4aec8	audience resolve	openid-connect	oidc-audience-resolve-mapper	08d131cd-0552-48c8-9846-9df64a4f58aa	\N
c1ec5ed7-9cfb-42e7-ab74-dc4285f035cd	role list	saml	saml-role-list-mapper	\N	a84bc83c-78b7-49d5-97b8-86c0c747991d
c4797e9e-7e21-42de-a8a4-efd7d4c4fc67	organization	saml	saml-organization-membership-mapper	\N	4ab4bb65-bd10-408d-8b13-36e1fe495ec2
9f4df5e9-e0ac-44ae-b260-0c96a80ac3f4	full name	openid-connect	oidc-full-name-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
4391da53-ee0a-4b32-bec7-0ed5a2280680	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
46715f9e-0f70-4792-a75d-a57f81eb8e55	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
d0d2b413-d5ca-4016-b550-039bbf40eeb4	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	username	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
93633cd5-29c4-4c71-bb65-0e413dfc84ef	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
02d5296b-428d-4c27-8bc1-9be7a6454290	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
fda48ef4-4d62-4c9a-a355-e151c76bd266	website	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
edb02653-12b7-4a8e-bc9f-280ad1a1650c	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
58218f2d-ede3-41c6-b088-401538d665fa	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
ff3573ff-3d8b-41ec-aebc-0546224f4d93	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	04e9cc6b-62b9-4e92-b75d-5e25a5d88469
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	email	openid-connect	oidc-usermodel-attribute-mapper	\N	3d158b09-68cd-4aed-9b4e-602ff6a04c2f
34636071-12e3-478a-aa6a-06677536f911	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3d158b09-68cd-4aed-9b4e-602ff6a04c2f
52a1fec8-0248-4f55-9273-d57dee09dde7	address	openid-connect	oidc-address-mapper	\N	7b93052a-49f9-4b9a-86f7-14971d17c419
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	7e8d0f86-8acc-4e23-b2e9-e38ab4540375
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	7e8d0f86-8acc-4e23-b2e9-e38ab4540375
5545430b-6a11-4cb8-a259-f25b511dfa60	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087
9fcf9a3b-9651-40e5-a972-37f57ddd395a	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087
5bbf01fa-a5c0-4014-b242-842a67e42d93	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a8d08ecf-eacd-4491-8cdf-d18fc8ad8087
30189893-fea2-4484-b3a1-6933a89e96f3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	3a771edb-6aa0-4b55-acc3-8127ff9c83da
d7f017db-b10c-4dd1-bb44-9f68ff790626	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	aa1c7ac6-b58b-4bcf-8a48-1011cb96da53
1e1e9749-029d-4caa-9c40-3ec9c64072b1	acr loa level	openid-connect	oidc-acr-mapper	\N	3b614f98-c24c-4953-9d65-4b1fe3dc8283
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	893bd505-8615-492d-ba4e-210bbdca498c
830d4206-cada-409b-bee2-1aae08e2168e	sub	openid-connect	oidc-sub-mapper	\N	893bd505-8615-492d-ba4e-210bbdca498c
6c8171cf-a285-4d2e-955e-aa8a0d509598	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	ac283e23-1fda-426e-8a3f-ecb4aed0dd38
926dc08d-e675-4561-99ed-7536af2a3139	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	ac283e23-1fda-426e-8a3f-ecb4aed0dd38
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	ac283e23-1fda-426e-8a3f-ecb4aed0dd38
984efa7a-b30d-4574-b484-49ae2f7267bf	organization	openid-connect	oidc-organization-membership-mapper	\N	9ad6313f-fd6d-42e9-8237-431cfc5b8a1d
21ed5648-b76e-48ed-9a3b-809d1b709d3c	locale	openid-connect	oidc-usermodel-attribute-mapper	d392252b-18f6-42b6-a16e-dbea5f5b5a1b	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
afe34553-2c50-4dcb-aa5b-dc38245835c1	true	introspection.token.claim
afe34553-2c50-4dcb-aa5b-dc38245835c1	true	userinfo.token.claim
afe34553-2c50-4dcb-aa5b-dc38245835c1	locale	user.attribute
afe34553-2c50-4dcb-aa5b-dc38245835c1	true	id.token.claim
afe34553-2c50-4dcb-aa5b-dc38245835c1	true	access.token.claim
afe34553-2c50-4dcb-aa5b-dc38245835c1	locale	claim.name
afe34553-2c50-4dcb-aa5b-dc38245835c1	String	jsonType.label
e2b6f5f1-67e7-42f8-88af-53a771631c1e	false	single
e2b6f5f1-67e7-42f8-88af-53a771631c1e	Basic	attribute.nameformat
e2b6f5f1-67e7-42f8-88af-53a771631c1e	Role	attribute.name
0a95ec3f-608c-4c8b-aa8c-78612bd08158	true	introspection.token.claim
0a95ec3f-608c-4c8b-aa8c-78612bd08158	true	userinfo.token.claim
0a95ec3f-608c-4c8b-aa8c-78612bd08158	profile	user.attribute
0a95ec3f-608c-4c8b-aa8c-78612bd08158	true	id.token.claim
0a95ec3f-608c-4c8b-aa8c-78612bd08158	true	access.token.claim
0a95ec3f-608c-4c8b-aa8c-78612bd08158	profile	claim.name
0a95ec3f-608c-4c8b-aa8c-78612bd08158	String	jsonType.label
1404df6a-d1ff-45bb-b875-79ef61a1292c	true	introspection.token.claim
1404df6a-d1ff-45bb-b875-79ef61a1292c	true	userinfo.token.claim
1404df6a-d1ff-45bb-b875-79ef61a1292c	gender	user.attribute
1404df6a-d1ff-45bb-b875-79ef61a1292c	true	id.token.claim
1404df6a-d1ff-45bb-b875-79ef61a1292c	true	access.token.claim
1404df6a-d1ff-45bb-b875-79ef61a1292c	gender	claim.name
1404df6a-d1ff-45bb-b875-79ef61a1292c	String	jsonType.label
22fc86bf-b716-419a-a653-c830a357f8e2	true	introspection.token.claim
22fc86bf-b716-419a-a653-c830a357f8e2	true	userinfo.token.claim
22fc86bf-b716-419a-a653-c830a357f8e2	true	id.token.claim
22fc86bf-b716-419a-a653-c830a357f8e2	true	access.token.claim
4215f913-6ab5-4566-8136-676bd7f88f3c	true	introspection.token.claim
4215f913-6ab5-4566-8136-676bd7f88f3c	true	userinfo.token.claim
4215f913-6ab5-4566-8136-676bd7f88f3c	username	user.attribute
4215f913-6ab5-4566-8136-676bd7f88f3c	true	id.token.claim
4215f913-6ab5-4566-8136-676bd7f88f3c	true	access.token.claim
4215f913-6ab5-4566-8136-676bd7f88f3c	preferred_username	claim.name
4215f913-6ab5-4566-8136-676bd7f88f3c	String	jsonType.label
7f68732c-d4d1-4c6b-975d-360160dc462e	true	introspection.token.claim
7f68732c-d4d1-4c6b-975d-360160dc462e	true	userinfo.token.claim
7f68732c-d4d1-4c6b-975d-360160dc462e	picture	user.attribute
7f68732c-d4d1-4c6b-975d-360160dc462e	true	id.token.claim
7f68732c-d4d1-4c6b-975d-360160dc462e	true	access.token.claim
7f68732c-d4d1-4c6b-975d-360160dc462e	picture	claim.name
7f68732c-d4d1-4c6b-975d-360160dc462e	String	jsonType.label
92a39aff-786c-47db-a495-779b1486f08c	true	introspection.token.claim
92a39aff-786c-47db-a495-779b1486f08c	true	userinfo.token.claim
92a39aff-786c-47db-a495-779b1486f08c	nickname	user.attribute
92a39aff-786c-47db-a495-779b1486f08c	true	id.token.claim
92a39aff-786c-47db-a495-779b1486f08c	true	access.token.claim
92a39aff-786c-47db-a495-779b1486f08c	nickname	claim.name
92a39aff-786c-47db-a495-779b1486f08c	String	jsonType.label
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	true	introspection.token.claim
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	true	userinfo.token.claim
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	website	user.attribute
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	true	id.token.claim
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	true	access.token.claim
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	website	claim.name
9eaec8f6-1d54-4813-b086-a4fbc85c4d56	String	jsonType.label
aae94480-0735-4dd7-be49-efa54bfd9957	true	introspection.token.claim
aae94480-0735-4dd7-be49-efa54bfd9957	true	userinfo.token.claim
aae94480-0735-4dd7-be49-efa54bfd9957	firstName	user.attribute
aae94480-0735-4dd7-be49-efa54bfd9957	true	id.token.claim
aae94480-0735-4dd7-be49-efa54bfd9957	true	access.token.claim
aae94480-0735-4dd7-be49-efa54bfd9957	given_name	claim.name
aae94480-0735-4dd7-be49-efa54bfd9957	String	jsonType.label
bd88fdd9-10bd-43c2-bf8a-370e311fd866	true	introspection.token.claim
bd88fdd9-10bd-43c2-bf8a-370e311fd866	true	userinfo.token.claim
bd88fdd9-10bd-43c2-bf8a-370e311fd866	middleName	user.attribute
bd88fdd9-10bd-43c2-bf8a-370e311fd866	true	id.token.claim
bd88fdd9-10bd-43c2-bf8a-370e311fd866	true	access.token.claim
bd88fdd9-10bd-43c2-bf8a-370e311fd866	middle_name	claim.name
bd88fdd9-10bd-43c2-bf8a-370e311fd866	String	jsonType.label
d7f2a2b3-63f8-4046-b21c-65b6eee01181	true	introspection.token.claim
d7f2a2b3-63f8-4046-b21c-65b6eee01181	true	userinfo.token.claim
d7f2a2b3-63f8-4046-b21c-65b6eee01181	lastName	user.attribute
d7f2a2b3-63f8-4046-b21c-65b6eee01181	true	id.token.claim
d7f2a2b3-63f8-4046-b21c-65b6eee01181	true	access.token.claim
d7f2a2b3-63f8-4046-b21c-65b6eee01181	family_name	claim.name
d7f2a2b3-63f8-4046-b21c-65b6eee01181	String	jsonType.label
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	true	introspection.token.claim
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	true	userinfo.token.claim
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	locale	user.attribute
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	true	id.token.claim
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	true	access.token.claim
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	locale	claim.name
dac7ab6e-96aa-41dc-bdf9-2fc750b5931b	String	jsonType.label
e9db0349-0569-4ffe-85f4-d4227ac12b2d	true	introspection.token.claim
e9db0349-0569-4ffe-85f4-d4227ac12b2d	true	userinfo.token.claim
e9db0349-0569-4ffe-85f4-d4227ac12b2d	birthdate	user.attribute
e9db0349-0569-4ffe-85f4-d4227ac12b2d	true	id.token.claim
e9db0349-0569-4ffe-85f4-d4227ac12b2d	true	access.token.claim
e9db0349-0569-4ffe-85f4-d4227ac12b2d	birthdate	claim.name
e9db0349-0569-4ffe-85f4-d4227ac12b2d	String	jsonType.label
f50be48c-a08a-4cb0-b818-25482d63b157	true	introspection.token.claim
f50be48c-a08a-4cb0-b818-25482d63b157	true	userinfo.token.claim
f50be48c-a08a-4cb0-b818-25482d63b157	zoneinfo	user.attribute
f50be48c-a08a-4cb0-b818-25482d63b157	true	id.token.claim
f50be48c-a08a-4cb0-b818-25482d63b157	true	access.token.claim
f50be48c-a08a-4cb0-b818-25482d63b157	zoneinfo	claim.name
f50be48c-a08a-4cb0-b818-25482d63b157	String	jsonType.label
fea2f411-f878-4a78-96f5-ca92eaf4a154	true	introspection.token.claim
fea2f411-f878-4a78-96f5-ca92eaf4a154	true	userinfo.token.claim
fea2f411-f878-4a78-96f5-ca92eaf4a154	updatedAt	user.attribute
fea2f411-f878-4a78-96f5-ca92eaf4a154	true	id.token.claim
fea2f411-f878-4a78-96f5-ca92eaf4a154	true	access.token.claim
fea2f411-f878-4a78-96f5-ca92eaf4a154	updated_at	claim.name
fea2f411-f878-4a78-96f5-ca92eaf4a154	long	jsonType.label
2978ba67-031b-4771-af23-07b2363c34f8	true	introspection.token.claim
2978ba67-031b-4771-af23-07b2363c34f8	true	userinfo.token.claim
2978ba67-031b-4771-af23-07b2363c34f8	email	user.attribute
2978ba67-031b-4771-af23-07b2363c34f8	true	id.token.claim
2978ba67-031b-4771-af23-07b2363c34f8	true	access.token.claim
2978ba67-031b-4771-af23-07b2363c34f8	email	claim.name
2978ba67-031b-4771-af23-07b2363c34f8	String	jsonType.label
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	true	introspection.token.claim
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	true	userinfo.token.claim
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	emailVerified	user.attribute
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	true	id.token.claim
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	true	access.token.claim
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	email_verified	claim.name
bf8e4b1d-20d8-4e11-b817-0b27d77ff3fe	boolean	jsonType.label
7e440bf9-29c0-4247-b69a-6abbe042201e	formatted	user.attribute.formatted
7e440bf9-29c0-4247-b69a-6abbe042201e	country	user.attribute.country
7e440bf9-29c0-4247-b69a-6abbe042201e	true	introspection.token.claim
7e440bf9-29c0-4247-b69a-6abbe042201e	postal_code	user.attribute.postal_code
7e440bf9-29c0-4247-b69a-6abbe042201e	true	userinfo.token.claim
7e440bf9-29c0-4247-b69a-6abbe042201e	street	user.attribute.street
7e440bf9-29c0-4247-b69a-6abbe042201e	true	id.token.claim
7e440bf9-29c0-4247-b69a-6abbe042201e	region	user.attribute.region
7e440bf9-29c0-4247-b69a-6abbe042201e	true	access.token.claim
7e440bf9-29c0-4247-b69a-6abbe042201e	locality	user.attribute.locality
190549c1-bc96-4785-9f9e-2139825fa483	true	introspection.token.claim
190549c1-bc96-4785-9f9e-2139825fa483	true	userinfo.token.claim
190549c1-bc96-4785-9f9e-2139825fa483	phoneNumber	user.attribute
190549c1-bc96-4785-9f9e-2139825fa483	true	id.token.claim
190549c1-bc96-4785-9f9e-2139825fa483	true	access.token.claim
190549c1-bc96-4785-9f9e-2139825fa483	phone_number	claim.name
190549c1-bc96-4785-9f9e-2139825fa483	String	jsonType.label
8fe09873-6bbf-4407-ba72-9519dcefc2d6	true	introspection.token.claim
8fe09873-6bbf-4407-ba72-9519dcefc2d6	true	userinfo.token.claim
8fe09873-6bbf-4407-ba72-9519dcefc2d6	phoneNumberVerified	user.attribute
8fe09873-6bbf-4407-ba72-9519dcefc2d6	true	id.token.claim
8fe09873-6bbf-4407-ba72-9519dcefc2d6	true	access.token.claim
8fe09873-6bbf-4407-ba72-9519dcefc2d6	phone_number_verified	claim.name
8fe09873-6bbf-4407-ba72-9519dcefc2d6	boolean	jsonType.label
b6233d4e-b863-48bd-9ad8-27d4909855b2	true	introspection.token.claim
b6233d4e-b863-48bd-9ad8-27d4909855b2	true	multivalued
b6233d4e-b863-48bd-9ad8-27d4909855b2	foo	user.attribute
b6233d4e-b863-48bd-9ad8-27d4909855b2	true	access.token.claim
b6233d4e-b863-48bd-9ad8-27d4909855b2	realm_access.roles	claim.name
b6233d4e-b863-48bd-9ad8-27d4909855b2	String	jsonType.label
bfbf0574-6efb-49ca-8ba1-dc970e66a81f	true	introspection.token.claim
bfbf0574-6efb-49ca-8ba1-dc970e66a81f	true	access.token.claim
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	true	introspection.token.claim
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	true	multivalued
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	foo	user.attribute
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	true	access.token.claim
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	resource_access.${client_id}.roles	claim.name
fbe2b3d9-1bce-48af-af4f-d9b68f04a3cb	String	jsonType.label
488fc1b2-600b-4af3-a270-1dd3a9d09430	true	introspection.token.claim
488fc1b2-600b-4af3-a270-1dd3a9d09430	true	access.token.claim
16709dfa-381f-4b13-8f6b-af943790f850	true	introspection.token.claim
16709dfa-381f-4b13-8f6b-af943790f850	true	multivalued
16709dfa-381f-4b13-8f6b-af943790f850	foo	user.attribute
16709dfa-381f-4b13-8f6b-af943790f850	true	id.token.claim
16709dfa-381f-4b13-8f6b-af943790f850	true	access.token.claim
16709dfa-381f-4b13-8f6b-af943790f850	groups	claim.name
16709dfa-381f-4b13-8f6b-af943790f850	String	jsonType.label
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	true	introspection.token.claim
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	true	userinfo.token.claim
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	username	user.attribute
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	true	id.token.claim
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	true	access.token.claim
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	upn	claim.name
bdea8a0c-8c5a-40fc-b23d-4e586f83432d	String	jsonType.label
6bc88524-68b1-444f-b76f-0b6aba5d6931	true	introspection.token.claim
6bc88524-68b1-444f-b76f-0b6aba5d6931	true	id.token.claim
6bc88524-68b1-444f-b76f-0b6aba5d6931	true	access.token.claim
5262d800-43bf-45a1-9bfc-fbe822ed5722	AUTH_TIME	user.session.note
5262d800-43bf-45a1-9bfc-fbe822ed5722	true	introspection.token.claim
5262d800-43bf-45a1-9bfc-fbe822ed5722	true	id.token.claim
5262d800-43bf-45a1-9bfc-fbe822ed5722	true	access.token.claim
5262d800-43bf-45a1-9bfc-fbe822ed5722	auth_time	claim.name
5262d800-43bf-45a1-9bfc-fbe822ed5722	long	jsonType.label
d61d2a3e-9dc5-4f2c-a395-8ed0c32a079a	true	introspection.token.claim
d61d2a3e-9dc5-4f2c-a395-8ed0c32a079a	true	access.token.claim
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	clientHost	user.session.note
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	true	introspection.token.claim
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	true	id.token.claim
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	true	access.token.claim
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	clientHost	claim.name
80bd8e0a-c9cd-487b-8e61-ccc5e646d903	String	jsonType.label
ec717c4b-6cf1-463a-a91a-e12ebd02d591	client_id	user.session.note
ec717c4b-6cf1-463a-a91a-e12ebd02d591	true	introspection.token.claim
ec717c4b-6cf1-463a-a91a-e12ebd02d591	true	id.token.claim
ec717c4b-6cf1-463a-a91a-e12ebd02d591	true	access.token.claim
ec717c4b-6cf1-463a-a91a-e12ebd02d591	client_id	claim.name
ec717c4b-6cf1-463a-a91a-e12ebd02d591	String	jsonType.label
fdde767a-4165-4458-a22b-a62a59d1fa56	clientAddress	user.session.note
fdde767a-4165-4458-a22b-a62a59d1fa56	true	introspection.token.claim
fdde767a-4165-4458-a22b-a62a59d1fa56	true	id.token.claim
fdde767a-4165-4458-a22b-a62a59d1fa56	true	access.token.claim
fdde767a-4165-4458-a22b-a62a59d1fa56	clientAddress	claim.name
fdde767a-4165-4458-a22b-a62a59d1fa56	String	jsonType.label
d01b7785-56fa-48e9-9d55-7a8a037db52b	true	introspection.token.claim
d01b7785-56fa-48e9-9d55-7a8a037db52b	true	multivalued
d01b7785-56fa-48e9-9d55-7a8a037db52b	true	id.token.claim
d01b7785-56fa-48e9-9d55-7a8a037db52b	true	access.token.claim
d01b7785-56fa-48e9-9d55-7a8a037db52b	organization	claim.name
d01b7785-56fa-48e9-9d55-7a8a037db52b	String	jsonType.label
c1ec5ed7-9cfb-42e7-ab74-dc4285f035cd	false	single
c1ec5ed7-9cfb-42e7-ab74-dc4285f035cd	Basic	attribute.nameformat
c1ec5ed7-9cfb-42e7-ab74-dc4285f035cd	Role	attribute.name
02d5296b-428d-4c27-8bc1-9be7a6454290	true	introspection.token.claim
02d5296b-428d-4c27-8bc1-9be7a6454290	true	userinfo.token.claim
02d5296b-428d-4c27-8bc1-9be7a6454290	picture	user.attribute
02d5296b-428d-4c27-8bc1-9be7a6454290	true	id.token.claim
02d5296b-428d-4c27-8bc1-9be7a6454290	true	access.token.claim
02d5296b-428d-4c27-8bc1-9be7a6454290	picture	claim.name
02d5296b-428d-4c27-8bc1-9be7a6454290	String	jsonType.label
4391da53-ee0a-4b32-bec7-0ed5a2280680	true	introspection.token.claim
4391da53-ee0a-4b32-bec7-0ed5a2280680	true	userinfo.token.claim
4391da53-ee0a-4b32-bec7-0ed5a2280680	firstName	user.attribute
4391da53-ee0a-4b32-bec7-0ed5a2280680	true	id.token.claim
4391da53-ee0a-4b32-bec7-0ed5a2280680	true	access.token.claim
4391da53-ee0a-4b32-bec7-0ed5a2280680	given_name	claim.name
4391da53-ee0a-4b32-bec7-0ed5a2280680	String	jsonType.label
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	true	introspection.token.claim
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	true	userinfo.token.claim
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	lastName	user.attribute
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	true	id.token.claim
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	true	access.token.claim
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	family_name	claim.name
44f5836b-d244-4c3b-adc3-efd2b95d0f3b	String	jsonType.label
46715f9e-0f70-4792-a75d-a57f81eb8e55	true	introspection.token.claim
46715f9e-0f70-4792-a75d-a57f81eb8e55	true	userinfo.token.claim
46715f9e-0f70-4792-a75d-a57f81eb8e55	middleName	user.attribute
46715f9e-0f70-4792-a75d-a57f81eb8e55	true	id.token.claim
46715f9e-0f70-4792-a75d-a57f81eb8e55	true	access.token.claim
46715f9e-0f70-4792-a75d-a57f81eb8e55	middle_name	claim.name
46715f9e-0f70-4792-a75d-a57f81eb8e55	String	jsonType.label
58218f2d-ede3-41c6-b088-401538d665fa	true	introspection.token.claim
58218f2d-ede3-41c6-b088-401538d665fa	true	userinfo.token.claim
58218f2d-ede3-41c6-b088-401538d665fa	locale	user.attribute
58218f2d-ede3-41c6-b088-401538d665fa	true	id.token.claim
58218f2d-ede3-41c6-b088-401538d665fa	true	access.token.claim
58218f2d-ede3-41c6-b088-401538d665fa	locale	claim.name
58218f2d-ede3-41c6-b088-401538d665fa	String	jsonType.label
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	true	introspection.token.claim
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	true	userinfo.token.claim
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	birthdate	user.attribute
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	true	id.token.claim
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	true	access.token.claim
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	birthdate	claim.name
7ad25173-c335-41f4-99c5-1cfbc1cf72a6	String	jsonType.label
93633cd5-29c4-4c71-bb65-0e413dfc84ef	true	introspection.token.claim
93633cd5-29c4-4c71-bb65-0e413dfc84ef	true	userinfo.token.claim
93633cd5-29c4-4c71-bb65-0e413dfc84ef	profile	user.attribute
93633cd5-29c4-4c71-bb65-0e413dfc84ef	true	id.token.claim
93633cd5-29c4-4c71-bb65-0e413dfc84ef	true	access.token.claim
93633cd5-29c4-4c71-bb65-0e413dfc84ef	profile	claim.name
93633cd5-29c4-4c71-bb65-0e413dfc84ef	String	jsonType.label
9f4df5e9-e0ac-44ae-b260-0c96a80ac3f4	true	introspection.token.claim
9f4df5e9-e0ac-44ae-b260-0c96a80ac3f4	true	userinfo.token.claim
9f4df5e9-e0ac-44ae-b260-0c96a80ac3f4	true	id.token.claim
9f4df5e9-e0ac-44ae-b260-0c96a80ac3f4	true	access.token.claim
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	true	introspection.token.claim
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	true	userinfo.token.claim
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	username	user.attribute
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	true	id.token.claim
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	true	access.token.claim
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	preferred_username	claim.name
c811e5b4-9f53-4c33-abe8-3594b6fe28f1	String	jsonType.label
d0d2b413-d5ca-4016-b550-039bbf40eeb4	true	introspection.token.claim
d0d2b413-d5ca-4016-b550-039bbf40eeb4	true	userinfo.token.claim
d0d2b413-d5ca-4016-b550-039bbf40eeb4	nickname	user.attribute
d0d2b413-d5ca-4016-b550-039bbf40eeb4	true	id.token.claim
d0d2b413-d5ca-4016-b550-039bbf40eeb4	true	access.token.claim
d0d2b413-d5ca-4016-b550-039bbf40eeb4	nickname	claim.name
d0d2b413-d5ca-4016-b550-039bbf40eeb4	String	jsonType.label
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	true	introspection.token.claim
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	true	userinfo.token.claim
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	gender	user.attribute
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	true	id.token.claim
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	true	access.token.claim
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	gender	claim.name
dfccd87e-3685-4193-9bfb-23e8fe6e4b70	String	jsonType.label
edb02653-12b7-4a8e-bc9f-280ad1a1650c	true	introspection.token.claim
edb02653-12b7-4a8e-bc9f-280ad1a1650c	true	userinfo.token.claim
edb02653-12b7-4a8e-bc9f-280ad1a1650c	zoneinfo	user.attribute
edb02653-12b7-4a8e-bc9f-280ad1a1650c	true	id.token.claim
edb02653-12b7-4a8e-bc9f-280ad1a1650c	true	access.token.claim
edb02653-12b7-4a8e-bc9f-280ad1a1650c	zoneinfo	claim.name
edb02653-12b7-4a8e-bc9f-280ad1a1650c	String	jsonType.label
fda48ef4-4d62-4c9a-a355-e151c76bd266	true	introspection.token.claim
fda48ef4-4d62-4c9a-a355-e151c76bd266	true	userinfo.token.claim
fda48ef4-4d62-4c9a-a355-e151c76bd266	website	user.attribute
fda48ef4-4d62-4c9a-a355-e151c76bd266	true	id.token.claim
fda48ef4-4d62-4c9a-a355-e151c76bd266	true	access.token.claim
fda48ef4-4d62-4c9a-a355-e151c76bd266	website	claim.name
fda48ef4-4d62-4c9a-a355-e151c76bd266	String	jsonType.label
ff3573ff-3d8b-41ec-aebc-0546224f4d93	true	introspection.token.claim
ff3573ff-3d8b-41ec-aebc-0546224f4d93	true	userinfo.token.claim
ff3573ff-3d8b-41ec-aebc-0546224f4d93	updatedAt	user.attribute
ff3573ff-3d8b-41ec-aebc-0546224f4d93	true	id.token.claim
ff3573ff-3d8b-41ec-aebc-0546224f4d93	true	access.token.claim
ff3573ff-3d8b-41ec-aebc-0546224f4d93	updated_at	claim.name
ff3573ff-3d8b-41ec-aebc-0546224f4d93	long	jsonType.label
34636071-12e3-478a-aa6a-06677536f911	true	introspection.token.claim
34636071-12e3-478a-aa6a-06677536f911	true	userinfo.token.claim
34636071-12e3-478a-aa6a-06677536f911	emailVerified	user.attribute
34636071-12e3-478a-aa6a-06677536f911	true	id.token.claim
34636071-12e3-478a-aa6a-06677536f911	true	access.token.claim
34636071-12e3-478a-aa6a-06677536f911	email_verified	claim.name
34636071-12e3-478a-aa6a-06677536f911	boolean	jsonType.label
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	true	introspection.token.claim
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	true	userinfo.token.claim
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	email	user.attribute
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	true	id.token.claim
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	true	access.token.claim
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	email	claim.name
d6cd6a5e-18d2-4d68-9144-5fab3fa98037	String	jsonType.label
52a1fec8-0248-4f55-9273-d57dee09dde7	formatted	user.attribute.formatted
52a1fec8-0248-4f55-9273-d57dee09dde7	country	user.attribute.country
52a1fec8-0248-4f55-9273-d57dee09dde7	true	introspection.token.claim
52a1fec8-0248-4f55-9273-d57dee09dde7	postal_code	user.attribute.postal_code
52a1fec8-0248-4f55-9273-d57dee09dde7	true	userinfo.token.claim
52a1fec8-0248-4f55-9273-d57dee09dde7	street	user.attribute.street
52a1fec8-0248-4f55-9273-d57dee09dde7	true	id.token.claim
52a1fec8-0248-4f55-9273-d57dee09dde7	region	user.attribute.region
52a1fec8-0248-4f55-9273-d57dee09dde7	true	access.token.claim
52a1fec8-0248-4f55-9273-d57dee09dde7	locality	user.attribute.locality
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	true	introspection.token.claim
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	true	userinfo.token.claim
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	phoneNumber	user.attribute
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	true	id.token.claim
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	true	access.token.claim
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	phone_number	claim.name
2b9bded9-6e8a-45b2-a718-ef3cf93e3660	String	jsonType.label
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	true	introspection.token.claim
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	true	userinfo.token.claim
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	phoneNumberVerified	user.attribute
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	true	id.token.claim
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	true	access.token.claim
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	phone_number_verified	claim.name
7b8e3f8b-fadf-4bce-bf0b-24118d7a34ae	boolean	jsonType.label
5545430b-6a11-4cb8-a259-f25b511dfa60	true	introspection.token.claim
5545430b-6a11-4cb8-a259-f25b511dfa60	true	multivalued
5545430b-6a11-4cb8-a259-f25b511dfa60	foo	user.attribute
5545430b-6a11-4cb8-a259-f25b511dfa60	true	access.token.claim
5545430b-6a11-4cb8-a259-f25b511dfa60	realm_access.roles	claim.name
5545430b-6a11-4cb8-a259-f25b511dfa60	String	jsonType.label
5bbf01fa-a5c0-4014-b242-842a67e42d93	true	introspection.token.claim
5bbf01fa-a5c0-4014-b242-842a67e42d93	true	access.token.claim
9fcf9a3b-9651-40e5-a972-37f57ddd395a	true	introspection.token.claim
9fcf9a3b-9651-40e5-a972-37f57ddd395a	true	multivalued
9fcf9a3b-9651-40e5-a972-37f57ddd395a	foo	user.attribute
9fcf9a3b-9651-40e5-a972-37f57ddd395a	true	access.token.claim
9fcf9a3b-9651-40e5-a972-37f57ddd395a	resource_access.${client_id}.roles	claim.name
9fcf9a3b-9651-40e5-a972-37f57ddd395a	String	jsonType.label
30189893-fea2-4484-b3a1-6933a89e96f3	true	introspection.token.claim
30189893-fea2-4484-b3a1-6933a89e96f3	true	access.token.claim
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	true	introspection.token.claim
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	true	multivalued
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	foo	user.attribute
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	true	id.token.claim
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	true	access.token.claim
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	groups	claim.name
600ab8e7-03b6-40a4-9ce1-51507a7c7e26	String	jsonType.label
d7f017db-b10c-4dd1-bb44-9f68ff790626	true	introspection.token.claim
d7f017db-b10c-4dd1-bb44-9f68ff790626	true	userinfo.token.claim
d7f017db-b10c-4dd1-bb44-9f68ff790626	username	user.attribute
d7f017db-b10c-4dd1-bb44-9f68ff790626	true	id.token.claim
d7f017db-b10c-4dd1-bb44-9f68ff790626	true	access.token.claim
d7f017db-b10c-4dd1-bb44-9f68ff790626	upn	claim.name
d7f017db-b10c-4dd1-bb44-9f68ff790626	String	jsonType.label
1e1e9749-029d-4caa-9c40-3ec9c64072b1	true	introspection.token.claim
1e1e9749-029d-4caa-9c40-3ec9c64072b1	true	id.token.claim
1e1e9749-029d-4caa-9c40-3ec9c64072b1	true	access.token.claim
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	AUTH_TIME	user.session.note
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	true	introspection.token.claim
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	true	id.token.claim
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	true	access.token.claim
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	auth_time	claim.name
245e15a4-b78c-45eb-ab0a-76ad0a468ec7	long	jsonType.label
830d4206-cada-409b-bee2-1aae08e2168e	true	introspection.token.claim
830d4206-cada-409b-bee2-1aae08e2168e	true	access.token.claim
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	clientAddress	user.session.note
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	true	introspection.token.claim
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	true	id.token.claim
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	true	access.token.claim
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	clientAddress	claim.name
3a5f3a4d-b164-491a-af4a-649fcf51b8b1	String	jsonType.label
6c8171cf-a285-4d2e-955e-aa8a0d509598	client_id	user.session.note
6c8171cf-a285-4d2e-955e-aa8a0d509598	true	introspection.token.claim
6c8171cf-a285-4d2e-955e-aa8a0d509598	true	id.token.claim
6c8171cf-a285-4d2e-955e-aa8a0d509598	true	access.token.claim
6c8171cf-a285-4d2e-955e-aa8a0d509598	client_id	claim.name
6c8171cf-a285-4d2e-955e-aa8a0d509598	String	jsonType.label
926dc08d-e675-4561-99ed-7536af2a3139	clientHost	user.session.note
926dc08d-e675-4561-99ed-7536af2a3139	true	introspection.token.claim
926dc08d-e675-4561-99ed-7536af2a3139	true	id.token.claim
926dc08d-e675-4561-99ed-7536af2a3139	true	access.token.claim
926dc08d-e675-4561-99ed-7536af2a3139	clientHost	claim.name
926dc08d-e675-4561-99ed-7536af2a3139	String	jsonType.label
984efa7a-b30d-4574-b484-49ae2f7267bf	true	introspection.token.claim
984efa7a-b30d-4574-b484-49ae2f7267bf	true	multivalued
984efa7a-b30d-4574-b484-49ae2f7267bf	true	id.token.claim
984efa7a-b30d-4574-b484-49ae2f7267bf	true	access.token.claim
984efa7a-b30d-4574-b484-49ae2f7267bf	organization	claim.name
984efa7a-b30d-4574-b484-49ae2f7267bf	String	jsonType.label
21ed5648-b76e-48ed-9a3b-809d1b709d3c	true	introspection.token.claim
21ed5648-b76e-48ed-9a3b-809d1b709d3c	true	userinfo.token.claim
21ed5648-b76e-48ed-9a3b-809d1b709d3c	locale	user.attribute
21ed5648-b76e-48ed-9a3b-809d1b709d3c	true	id.token.claim
21ed5648-b76e-48ed-9a3b-809d1b709d3c	true	access.token.claim
21ed5648-b76e-48ed-9a3b-809d1b709d3c	locale	claim.name
21ed5648-b76e-48ed-9a3b-809d1b709d3c	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
2b2b321a-629d-48cd-a065-806aca97437e	60	300	300	\N	\N	\N	t	f	0	\N	infozhur	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	f	54444296-874f-4a02-ab26-3c1263f65609	1800	t	ru	f	f	f	t	0	1	30	6	HmacSHA1	totp	87de095b-67d4-4669-91f6-8d81cac3a26f	f82c8f01-5e2e-46dd-8c06-9b03280c0103	56f10eb0-69ee-4eb8-a783-50db29cd5000	4ab7cb80-ebbe-45aa-b99f-b97d3378f1c6	500a092f-1606-4ba2-b90b-426cca2135e6	2592000	f	900	t	f	5a668e2c-cabd-454a-b45c-600421691497	0	f	0	0	ef2bd23d-2004-4a32-b640-6fdddf908922
a03a5306-1fa8-4e80-a095-103e9f150252	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	7d6b4c8e-f047-49a5-8671-d38d62e9944c	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	7174faff-f0d8-45d1-bbfe-1006dfadf9b9	82b1302a-e904-4266-86fc-7130a89ba62d	46ce77d8-5b4a-44ff-8ad1-9a39f2a70f49	daf4aaa6-2ae3-4277-8b45-e1d4a7481812	f5709df3-9eec-4eee-9873-2b0726ba991f	2592000	f	900	t	f	fae4ec2b-2a71-49b8-a9b6-04550c1adc9f	0	f	0	0	7ac03f7b-9314-480e-8f92-662a609d2b02
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	a03a5306-1fa8-4e80-a095-103e9f150252	
_browser_header.xContentTypeOptions	a03a5306-1fa8-4e80-a095-103e9f150252	nosniff
_browser_header.referrerPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	no-referrer
_browser_header.xRobotsTag	a03a5306-1fa8-4e80-a095-103e9f150252	none
_browser_header.xFrameOptions	a03a5306-1fa8-4e80-a095-103e9f150252	SAMEORIGIN
_browser_header.contentSecurityPolicy	a03a5306-1fa8-4e80-a095-103e9f150252	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	a03a5306-1fa8-4e80-a095-103e9f150252	max-age=31536000; includeSubDomains
bruteForceProtected	a03a5306-1fa8-4e80-a095-103e9f150252	false
permanentLockout	a03a5306-1fa8-4e80-a095-103e9f150252	false
maxTemporaryLockouts	a03a5306-1fa8-4e80-a095-103e9f150252	0
bruteForceStrategy	a03a5306-1fa8-4e80-a095-103e9f150252	MULTIPLE
maxFailureWaitSeconds	a03a5306-1fa8-4e80-a095-103e9f150252	900
minimumQuickLoginWaitSeconds	a03a5306-1fa8-4e80-a095-103e9f150252	60
waitIncrementSeconds	a03a5306-1fa8-4e80-a095-103e9f150252	60
quickLoginCheckMilliSeconds	a03a5306-1fa8-4e80-a095-103e9f150252	1000
maxDeltaTimeSeconds	a03a5306-1fa8-4e80-a095-103e9f150252	43200
failureFactor	a03a5306-1fa8-4e80-a095-103e9f150252	30
realmReusableOtpCode	a03a5306-1fa8-4e80-a095-103e9f150252	false
firstBrokerLoginFlowId	a03a5306-1fa8-4e80-a095-103e9f150252	3ce1064a-3925-4dea-8fb1-4021c4461ec9
displayName	a03a5306-1fa8-4e80-a095-103e9f150252	Keycloak
displayNameHtml	a03a5306-1fa8-4e80-a095-103e9f150252	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	a03a5306-1fa8-4e80-a095-103e9f150252	RS256
offlineSessionMaxLifespanEnabled	a03a5306-1fa8-4e80-a095-103e9f150252	false
offlineSessionMaxLifespan	a03a5306-1fa8-4e80-a095-103e9f150252	5184000
_browser_header.contentSecurityPolicyReportOnly	2b2b321a-629d-48cd-a065-806aca97437e	
_browser_header.xContentTypeOptions	2b2b321a-629d-48cd-a065-806aca97437e	nosniff
_browser_header.referrerPolicy	2b2b321a-629d-48cd-a065-806aca97437e	no-referrer
_browser_header.xRobotsTag	2b2b321a-629d-48cd-a065-806aca97437e	none
_browser_header.xFrameOptions	2b2b321a-629d-48cd-a065-806aca97437e	SAMEORIGIN
_browser_header.contentSecurityPolicy	2b2b321a-629d-48cd-a065-806aca97437e	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	2b2b321a-629d-48cd-a065-806aca97437e	max-age=31536000; includeSubDomains
bruteForceProtected	2b2b321a-629d-48cd-a065-806aca97437e	false
permanentLockout	2b2b321a-629d-48cd-a065-806aca97437e	false
maxTemporaryLockouts	2b2b321a-629d-48cd-a065-806aca97437e	0
bruteForceStrategy	2b2b321a-629d-48cd-a065-806aca97437e	MULTIPLE
maxFailureWaitSeconds	2b2b321a-629d-48cd-a065-806aca97437e	900
minimumQuickLoginWaitSeconds	2b2b321a-629d-48cd-a065-806aca97437e	60
waitIncrementSeconds	2b2b321a-629d-48cd-a065-806aca97437e	60
quickLoginCheckMilliSeconds	2b2b321a-629d-48cd-a065-806aca97437e	1000
maxDeltaTimeSeconds	2b2b321a-629d-48cd-a065-806aca97437e	43200
failureFactor	2b2b321a-629d-48cd-a065-806aca97437e	30
realmReusableOtpCode	2b2b321a-629d-48cd-a065-806aca97437e	false
defaultSignatureAlgorithm	2b2b321a-629d-48cd-a065-806aca97437e	RS256
offlineSessionMaxLifespanEnabled	2b2b321a-629d-48cd-a065-806aca97437e	false
offlineSessionMaxLifespan	2b2b321a-629d-48cd-a065-806aca97437e	5184000
actionTokenGeneratedByAdminLifespan	2b2b321a-629d-48cd-a065-806aca97437e	43200
actionTokenGeneratedByUserLifespan	2b2b321a-629d-48cd-a065-806aca97437e	300
oauth2DeviceCodeLifespan	2b2b321a-629d-48cd-a065-806aca97437e	600
oauth2DevicePollingInterval	2b2b321a-629d-48cd-a065-806aca97437e	5
webAuthnPolicyRpEntityName	2b2b321a-629d-48cd-a065-806aca97437e	keycloak
webAuthnPolicySignatureAlgorithms	2b2b321a-629d-48cd-a065-806aca97437e	ES256,RS256
webAuthnPolicyRpId	2b2b321a-629d-48cd-a065-806aca97437e	
webAuthnPolicyAttestationConveyancePreference	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyAuthenticatorAttachment	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyRequireResidentKey	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyUserVerificationRequirement	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyCreateTimeout	2b2b321a-629d-48cd-a065-806aca97437e	0
webAuthnPolicyAvoidSameAuthenticatorRegister	2b2b321a-629d-48cd-a065-806aca97437e	false
webAuthnPolicyRpEntityNamePasswordless	2b2b321a-629d-48cd-a065-806aca97437e	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	ES256,RS256
webAuthnPolicyRpIdPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	
webAuthnPolicyAttestationConveyancePreferencePasswordless	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyRequireResidentKeyPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	not specified
webAuthnPolicyCreateTimeoutPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	2b2b321a-629d-48cd-a065-806aca97437e	false
cibaBackchannelTokenDeliveryMode	2b2b321a-629d-48cd-a065-806aca97437e	poll
cibaExpiresIn	2b2b321a-629d-48cd-a065-806aca97437e	120
cibaInterval	2b2b321a-629d-48cd-a065-806aca97437e	5
cibaAuthRequestedUserHint	2b2b321a-629d-48cd-a065-806aca97437e	login_hint
parRequestUriLifespan	2b2b321a-629d-48cd-a065-806aca97437e	60
firstBrokerLoginFlowId	2b2b321a-629d-48cd-a065-806aca97437e	e93fd7c4-2626-4d5d-9f59-ca55658161ac
organizationsEnabled	2b2b321a-629d-48cd-a065-806aca97437e	false
adminPermissionsEnabled	2b2b321a-629d-48cd-a065-806aca97437e	false
verifiableCredentialsEnabled	2b2b321a-629d-48cd-a065-806aca97437e	false
clientSessionIdleTimeout	2b2b321a-629d-48cd-a065-806aca97437e	0
clientSessionMaxLifespan	2b2b321a-629d-48cd-a065-806aca97437e	0
clientOfflineSessionIdleTimeout	2b2b321a-629d-48cd-a065-806aca97437e	0
clientOfflineSessionMaxLifespan	2b2b321a-629d-48cd-a065-806aca97437e	0
client-policies.profiles	2b2b321a-629d-48cd-a065-806aca97437e	{"profiles":[]}
client-policies.policies	2b2b321a-629d-48cd-a065-806aca97437e	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
2b2b321a-629d-48cd-a065-806aca97437e	423448b1-df9a-446b-96e4-4658912ef48d
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
a03a5306-1fa8-4e80-a095-103e9f150252	jboss-logging
2b2b321a-629d-48cd-a065-806aca97437e	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	a03a5306-1fa8-4e80-a095-103e9f150252
password	password	t	t	2b2b321a-629d-48cd-a065-806aca97437e
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
2b2b321a-629d-48cd-a065-806aca97437e	ru
2b2b321a-629d-48cd-a065-806aca97437e	en
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
117ec0a4-3700-45dd-8142-eb1835f74494	/realms/master/account/*
6c4ad828-794d-4384-b0ee-944d9602d13c	/realms/master/account/*
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	/admin/master/console/*
2804df9c-bafd-4ac8-a1f1-02a7a6aa6f6f	/realms/infozhur/account/*
08d131cd-0552-48c8-9846-9df64a4f58aa	/realms/infozhur/account/*
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	/admin/infozhur/console/*
bb02fd1e-5d55-4c51-813a-64767c0b59b8	http://localhost:3000/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
9b5b9a57-c56c-4f41-8057-363c13dd1d90	VERIFY_EMAIL	Verify Email	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	VERIFY_EMAIL	50
9ed53811-4819-46b4-992d-5873c55cd946	UPDATE_PROFILE	Update Profile	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	UPDATE_PROFILE	40
88813285-5ae8-4c88-83c6-023f6d88f85a	CONFIGURE_TOTP	Configure OTP	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	CONFIGURE_TOTP	10
430bec45-86a6-4745-84a6-e7b47c3d379a	UPDATE_PASSWORD	Update Password	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	UPDATE_PASSWORD	30
9768f565-441b-41c5-ae9b-5cd6049d33d8	TERMS_AND_CONDITIONS	Terms and Conditions	a03a5306-1fa8-4e80-a095-103e9f150252	f	f	TERMS_AND_CONDITIONS	20
2157fdb2-740b-40fc-8f28-d61b48b62c43	delete_account	Delete Account	a03a5306-1fa8-4e80-a095-103e9f150252	f	f	delete_account	60
5c6a821a-2024-40be-9a94-4529b00a42c6	delete_credential	Delete Credential	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	delete_credential	100
ef4f39ae-17e2-475c-8263-5223e3150e99	update_user_locale	Update User Locale	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	update_user_locale	1000
1f53e8cc-8b3a-4006-9dab-ab4912b3092c	webauthn-register	Webauthn Register	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	webauthn-register	70
022e6f26-b3f1-4c1a-9971-b762f8374d4d	webauthn-register-passwordless	Webauthn Register Passwordless	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	webauthn-register-passwordless	80
8521ab00-4590-4866-ab15-a227de1f07e0	VERIFY_PROFILE	Verify Profile	a03a5306-1fa8-4e80-a095-103e9f150252	t	f	VERIFY_PROFILE	90
2f879756-02c4-405e-9b34-75b4f1e41e64	VERIFY_EMAIL	Verify Email	2b2b321a-629d-48cd-a065-806aca97437e	t	f	VERIFY_EMAIL	50
59d5c26c-353d-459e-b7e8-962ccd5c1441	UPDATE_PROFILE	Update Profile	2b2b321a-629d-48cd-a065-806aca97437e	t	f	UPDATE_PROFILE	40
64a87d2c-5952-418a-8d9b-42ac64a9d5e3	CONFIGURE_TOTP	Configure OTP	2b2b321a-629d-48cd-a065-806aca97437e	t	f	CONFIGURE_TOTP	10
65932c0c-5c6a-496f-ad36-5a63fd8185ad	UPDATE_PASSWORD	Update Password	2b2b321a-629d-48cd-a065-806aca97437e	t	f	UPDATE_PASSWORD	30
d09a8dbf-7bbe-4655-96c9-9f5454eaa5f5	TERMS_AND_CONDITIONS	Terms and Conditions	2b2b321a-629d-48cd-a065-806aca97437e	f	f	TERMS_AND_CONDITIONS	20
79e4a018-50ed-45f4-aae4-c89f447730f1	delete_account	Delete Account	2b2b321a-629d-48cd-a065-806aca97437e	f	f	delete_account	60
8aa581f2-7d4b-433d-b82c-5c636df991f6	delete_credential	Delete Credential	2b2b321a-629d-48cd-a065-806aca97437e	t	f	delete_credential	100
1a9d28f3-5bd9-45cf-8aec-4ad04bb612aa	update_user_locale	Update User Locale	2b2b321a-629d-48cd-a065-806aca97437e	t	f	update_user_locale	1000
f60faea0-6b9e-42cb-b95f-5d439ab47e19	webauthn-register	Webauthn Register	2b2b321a-629d-48cd-a065-806aca97437e	t	f	webauthn-register	70
41ff7237-85c6-4eed-9c7c-0489fcea9b41	webauthn-register-passwordless	Webauthn Register Passwordless	2b2b321a-629d-48cd-a065-806aca97437e	t	f	webauthn-register-passwordless	80
b2bb4ac1-d539-4dcb-918f-bb9283ec770c	VERIFY_PROFILE	Verify Profile	2b2b321a-629d-48cd-a065-806aca97437e	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
6c4ad828-794d-4384-b0ee-944d9602d13c	39c17f64-669f-463a-9db3-1da0b95f9efb
6c4ad828-794d-4384-b0ee-944d9602d13c	099f9edc-dc02-4b53-823c-9cb7a4def95b
08d131cd-0552-48c8-9846-9df64a4f58aa	0f49b79d-bc00-43ec-865c-250ed2e9b713
08d131cd-0552-48c8-9846-9df64a4f58aa	90f71f02-f518-4db2-9911-cf23e3b3d148
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
85db544d-b136-4a5c-9b63-cb044e833cfd	cebotarenkodima@gmail.com	cebotarenkodima@gmail.com	f	t	\N	\N	\N	a03a5306-1fa8-4e80-a095-103e9f150252	admin	1748892321110	\N	0
f0d998a2-db2d-47ea-8d84-022ea6249eec	cebotarenkodima@gmail.com	cebotarenkodima@gmail.com	f	t	\N	Дмитрий	Котовский	2b2b321a-629d-48cd-a065-806aca97437e	admin	1748892877315	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
a2ce6574-c838-4d00-9c36-97f4301e4c00	f0d998a2-db2d-47ea-8d84-022ea6249eec	UNMANAGED
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
7ac03f7b-9314-480e-8f92-662a609d2b02	85db544d-b136-4a5c-9b63-cb044e833cfd
3e900ee3-efd4-45fe-9d5b-d02f2fd237d4	85db544d-b136-4a5c-9b63-cb044e833cfd
a569ea4f-ced9-4c8c-a36d-6f070493a910	85db544d-b136-4a5c-9b63-cb044e833cfd
b04392ed-e234-4272-bf27-751a847dc777	85db544d-b136-4a5c-9b63-cb044e833cfd
93e54565-2db4-4368-b012-2d81420fb5cc	85db544d-b136-4a5c-9b63-cb044e833cfd
a6e29047-d610-47eb-a57b-c2a5ea11adc0	85db544d-b136-4a5c-9b63-cb044e833cfd
39c17f64-669f-463a-9db3-1da0b95f9efb	85db544d-b136-4a5c-9b63-cb044e833cfd
099f9edc-dc02-4b53-823c-9cb7a4def95b	85db544d-b136-4a5c-9b63-cb044e833cfd
210413db-bae7-46a3-b6f1-f1d9e911fc14	85db544d-b136-4a5c-9b63-cb044e833cfd
dbe90b4a-b103-40d3-a069-f13b9d5642c8	85db544d-b136-4a5c-9b63-cb044e833cfd
9a6191ba-aa9a-4f1d-84cd-614c79c878c7	85db544d-b136-4a5c-9b63-cb044e833cfd
1d8cdacb-c9e3-4c1c-a448-9e8b1242b37f	85db544d-b136-4a5c-9b63-cb044e833cfd
446119ea-5360-4d23-8c17-2f6404d22e32	85db544d-b136-4a5c-9b63-cb044e833cfd
ca3eed16-7f5b-480b-9b8b-b08891c3ba5a	85db544d-b136-4a5c-9b63-cb044e833cfd
852585ab-8d79-40b8-aaed-d015ed10969c	85db544d-b136-4a5c-9b63-cb044e833cfd
ef2bd23d-2004-4a32-b640-6fdddf908922	f0d998a2-db2d-47ea-8d84-022ea6249eec
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
5a4bb5c5-bef3-4247-9d91-f3b6c5f17820	+
d392252b-18f6-42b6-a16e-dbea5f5b5a1b	+
bb02fd1e-5d55-4c51-813a-64767c0b59b8	http://localhost:3000
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--


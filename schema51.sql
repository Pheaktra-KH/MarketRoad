--
-- PostgreSQL database cluster dump
--

-- Started on 2025-10-26 21:14:47

\restrict 588rULecwJJWhlAzcDlTUF5ZWYev4oYJhDhBI7LtxfgbIQfhnFN6zLgQQSlc9j7

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:LF2kxbjCz5UrwAvOqEBX2g==$9xQtj9QJtLgiLeBQUpECVhuADau+XLXl5kIzQVL+XfQ=:Fcw+x8GMWxgD2lbyfaZPFGBnitACiL4cFffbio1svrA=';

--
-- User Configurations
--








\unrestrict 588rULecwJJWhlAzcDlTUF5ZWYev4oYJhDhBI7LtxfgbIQfhnFN6zLgQQSlc9j7

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict fBzIfLuiqkdWhoo42u3NX9rfuMjW8o1nPbpncv5BHq6ejQZ4MUtRUpLPJaKdHNO

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-26 21:14:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-10-26 21:14:58

--
-- PostgreSQL database dump complete
--

\unrestrict fBzIfLuiqkdWhoo42u3NX9rfuMjW8o1nPbpncv5BHq6ejQZ4MUtRUpLPJaKdHNO

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict fNLdwbtC10zlVlGmSmz3XDLcaukI4SaJdlNTPAX428f6TKUytLbWeG4ek6MW7TZ

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-26 21:14:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-10-26 21:15:04

--
-- PostgreSQL database dump complete
--

\unrestrict fNLdwbtC10zlVlGmSmz3XDLcaukI4SaJdlNTPAX428f6TKUytLbWeG4ek6MW7TZ

--
-- Database "railway" dump
--

--
-- PostgreSQL database dump
--

\restrict NCZYmPlAcQWwx5DUXqblNNZImQ6xEFVEsbHpOiLiCHwzMtDQyBW8SV7MrElYoYA

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-26 21:15:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6231 (class 1262 OID 16384)
-- Name: railway; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE railway OWNER TO postgres;

\unrestrict NCZYmPlAcQWwx5DUXqblNNZImQ6xEFVEsbHpOiLiCHwzMtDQyBW8SV7MrElYoYA
\connect railway
\restrict NCZYmPlAcQWwx5DUXqblNNZImQ6xEFVEsbHpOiLiCHwzMtDQyBW8SV7MrElYoYA

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16399)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 6232 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 699 (class 1255 OID 22588)
-- Name: fn__log_finding(text, text, text, text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn__log_finding(p_category text, p_schema text, p_object text, p_severity text, p_finding text, p_advice text, p_fixable boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.sys_compliance_findings(category, object_schema, object_name, severity, finding, advice, auto_fix_possible)
  VALUES (p_category, p_schema, p_object, p_severity, p_finding, p_advice, p_fixable);
END;
$$;


ALTER FUNCTION public.fn__log_finding(p_category text, p_schema text, p_object text, p_severity text, p_finding text, p_advice text, p_fixable boolean) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 21432)
-- Name: fn_adapt_policy_from_alerts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_adapt_policy_from_alerts() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_alert RECORD;
  v_retention INT;
BEGIN
  FOR v_alert IN
    SELECT * FROM public.ai_compliance_alerts
    WHERE resolved = FALSE
    ORDER BY detected_at DESC
  LOOP
    IF v_alert.alert_type = 'PII_EXPORT' THEN
      UPDATE public.tenant_policies
      SET allow_data_export = FALSE, updated_at = now()
      WHERE tenant_id = v_alert.tenant_id;
      INSERT INTO public.ai_policy_rules(tenant_id, rule_name, rule_type, rule_definition, created_at)
      VALUES (v_alert.tenant_id, 'AutoDisableExport', 'export',
              jsonb_build_object('reason', 'Frequent PII export alerts', 'alert_id', v_alert.alert_id), now());
    ELSIF v_alert.alert_type = 'FAILED_JOB' THEN
      SELECT data_retention_days INTO v_retention FROM public.tenant_policies WHERE tenant_id = v_alert.tenant_id;
      UPDATE public.tenant_policies
      SET data_retention_days = GREATEST(30, v_retention - 30), updated_at = now()
      WHERE tenant_id = v_alert.tenant_id;
      INSERT INTO public.ai_policy_rules(tenant_id, rule_name, rule_type, rule_definition, created_at)
      VALUES (v_alert.tenant_id, 'ReduceRetentionPeriod', 'retention',
              jsonb_build_object('reason', 'Job failures detected', 'new_days', v_retention - 30), now());
    END IF;

    UPDATE public.ai_compliance_alerts
    SET resolved = TRUE, resolved_at = now()
    WHERE alert_id = v_alert.alert_id;
  END LOOP;
END;
$$;


ALTER FUNCTION public.fn_adapt_policy_from_alerts() OWNER TO postgres;

--
-- TOC entry 752 (class 1255 OID 21696)
-- Name: fn_agent_broadcast(bigint, text, text, jsonb, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_agent_broadcast(p_sender bigint, p_topic text, p_message_type text, p_payload jsonb, p_confidence numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_agent_messages(sender_agent_id, receiver_agent_id, topic, message_type, payload, confidence)
  SELECT p_sender, a.agent_id, p_topic, p_message_type, p_payload, p_confidence
  FROM public.ai_agent_registry a
  WHERE a.is_active = TRUE AND a.agent_id <> p_sender;
END;
$$;


ALTER FUNCTION public.fn_agent_broadcast(p_sender bigint, p_topic text, p_message_type text, p_payload jsonb, p_confidence numeric) OWNER TO postgres;

--
-- TOC entry 744 (class 1255 OID 21698)
-- Name: fn_agent_execute_collaborative_action(bigint, text, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_agent_execute_collaborative_action(p_negotiation_id bigint, p_action text, p_confidence numeric, p_expected_reward numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_agreement RECORD;
BEGIN
  INSERT INTO public.ai_agent_agreements(negotiation_id, agreed_action, confidence, expected_reward)
  VALUES (p_negotiation_id, p_action, p_confidence, p_expected_reward)
  RETURNING * INTO v_agreement;

  UPDATE public.ai_agent_agreements
  SET executed = TRUE, executed_at = now()
  WHERE agreement_id = v_agreement.agreement_id;

  PERFORM public.fn_record_rl_feedback(1, 'collaboration', v_agreement.agreement_id, CURRENT_DATE, p_expected_reward, p_expected_reward * (random()*0.3 + 0.9));

  RAISE NOTICE '✅ Multi-agent collaborative action executed: %', p_action;
END;
$$;


ALTER FUNCTION public.fn_agent_execute_collaborative_action(p_negotiation_id bigint, p_action text, p_confidence numeric, p_expected_reward numeric) OWNER TO postgres;

--
-- TOC entry 729 (class 1255 OID 21697)
-- Name: fn_agent_negotiate(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_agent_negotiate(p_topic text) RETURNS TABLE(negotiation_id bigint, consensus_score numeric, dominant_agent bigint, summary text)
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_rec RECORD;
  v_weighted NUMERIC := 0;
  v_total NUMERIC := 0;
  v_dominant BIGINT;
  v_summary TEXT := '';
  v_negotiation_id BIGINT;
  v_consensus_score NUMERIC;
BEGIN
  -- Create negotiation record
  INSERT INTO public.ai_agent_negotiations(topic, status)
  VALUES (p_topic, 'open')
  RETURNING ai_agent_negotiations.negotiation_id INTO v_negotiation_id;

  -- Collect all active agent signals for the topic
  FOR v_rec IN
    SELECT m.sender_agent_id AS agent_id, AVG(m.confidence) AS avg_conf, COUNT(*) AS votes
    FROM public.ai_agent_messages m
    WHERE m.topic = p_topic AND m.created_at >= now() - INTERVAL '5 minutes'
    GROUP BY m.sender_agent_id
  LOOP
    v_weighted := v_weighted + (v_rec.avg_conf * v_rec.votes);
    v_total := v_total + v_rec.votes;
  END LOOP;

  IF v_total > 0 THEN
    v_consensus_score := ROUND(v_weighted / v_total, 3);
  ELSE
    v_consensus_score := 0;
  END IF;

  SELECT m.sender_agent_id INTO v_dominant
  FROM public.ai_agent_messages m
  WHERE m.topic = p_topic
  GROUP BY m.sender_agent_id
  ORDER BY AVG(m.confidence) DESC
  LIMIT 1;

  v_summary := CONCAT('Negotiation topic "', p_topic, '" reached consensus of ', v_consensus_score, ' led by agent ', v_dominant);

  UPDATE public.ai_agent_negotiations n
  SET closed_at = now(),
      status = 'agreed',
      consensus_score = v_consensus_score,
      dominant_agent = v_dominant,
      summary = v_summary
  WHERE n.negotiation_id = v_negotiation_id;

  RETURN QUERY SELECT v_negotiation_id, v_consensus_score, v_dominant, v_summary;
END;
$$;


ALTER FUNCTION public.fn_agent_negotiate(p_topic text) OWNER TO postgres;

--
-- TOC entry 691 (class 1255 OID 21908)
-- Name: fn_aggregate_federated_model(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_aggregate_federated_model(p_round_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_new_model_id BIGINT;
  v_acc NUMERIC;
  v_loss NUMERIC;
  v_participants INT;
  v_aggregated_params JSONB := '{}'::JSONB;
BEGIN
  SELECT COUNT(*), AVG(local_accuracy), AVG(local_loss)
  INTO v_participants, v_acc, v_loss
  FROM public.ai_federated_updates WHERE round_id = p_round_id;

  -- ✅ FIX: compute average first, then aggregate JSON separately
  WITH agg_values AS (
      SELECT key, ROUND(AVG(value::NUMERIC), 6) AS avg_val
      FROM (
          SELECT kv.key, kv.value
          FROM public.ai_federated_updates u
          CROSS JOIN LATERAL jsonb_each_text(u.weight_delta) kv
          WHERE u.round_id = p_round_id
      ) expanded
      GROUP BY key
  )
  SELECT jsonb_object_agg(key, avg_val)
  INTO v_aggregated_params
  FROM agg_values;

  INSERT INTO public.ai_global_model_registry (model_name, version_no, parameters, accuracy, loss, aggregated_from)
  VALUES (
    'federated_global_model',
    COALESCE((SELECT MAX(version_no)+1 FROM public.ai_global_model_registry),1),
    v_aggregated_params,
    v_acc,
    v_loss,
    v_participants
  )
  RETURNING model_id INTO v_new_model_id;

  UPDATE public.ai_federated_rounds
  SET end_time = now(), status = 'completed',
      participant_count = v_participants,
      aggregated_accuracy = v_acc,
      aggregated_loss = v_loss
  WHERE round_id = p_round_id;

  RAISE NOTICE '🌍 Federated aggregation (fixed) completed: round %, accuracy %.4f', p_round_id, v_acc;
  RETURN v_new_model_id;
END;
$$;


ALTER FUNCTION public.fn_aggregate_federated_model(p_round_id bigint) OWNER TO postgres;

--
-- TOC entry 737 (class 1255 OID 22475)
-- Name: fn_analyze_profitability(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_analyze_profitability() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v RECORD;
BEGIN
  FOR v IN
    SELECT tenant_id,
           AVG(revenue) AS avg_rev,
           AVG(infra_cost + ai_cost) AS avg_cost,
           AVG(margin) AS avg_margin
    FROM public.ai_cost_forecasts
    GROUP BY tenant_id
  LOOP
    INSERT INTO public.ai_profitability_insights (tenant_id, avg_revenue, avg_cost, profit_margin, efficiency_score, detected_anomaly)
    VALUES (
      v.tenant_id,
      v.avg_rev,
      v.avg_cost,
      ROUND((v.avg_margin / NULLIF(v.avg_rev,0)) * 100, 2),
      ROUND((v.avg_margin / GREATEST(v.avg_cost,1)) * 10, 2),
      CASE WHEN (v.avg_margin < 0) THEN TRUE ELSE FALSE END
    );
  END LOOP;

  RAISE NOTICE '📊 Profitability insights updated successfully.';
END;
$$;


ALTER FUNCTION public.fn_analyze_profitability() OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 22151)
-- Name: fn_analyze_system_health(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_analyze_system_health() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_backlog INT;
    v_failed_jobs INT := 0;
    v_count INT := 0;
    v_latest_sales TIMESTAMPTZ;
BEGIN
    -- Check Outbox backlog
    SELECT COUNT(*) INTO v_backlog FROM public.rt_event_outbox WHERE status='pending';
    IF v_backlog > 1000 THEN
        INSERT INTO public.sys_health_events(event_type, severity, details)
        VALUES ('queue_backlog', 'warning', format('Outbox backlog %s events', v_backlog));
        v_count := v_count + 1;
    END IF;

    -- Check failed webhook deliveries
    SELECT COUNT(*) INTO v_failed_jobs FROM public.rt_webhook_deliveries WHERE status='failed';
    IF v_failed_jobs > 50 THEN
        INSERT INTO public.sys_health_events(event_type, severity, details)
        VALUES ('job_delay', 'warning', format('Failed deliveries %s', v_failed_jobs));
        v_count := v_count + 1;
    END IF;

    -- ✅ Check materialized view freshness by last sale_minute
    SELECT MAX(sale_minute) INTO v_latest_sales
    FROM public.mv_stream_sales_5m;

    IF v_latest_sales IS NULL OR v_latest_sales < now() - INTERVAL '10 minutes' THEN
        INSERT INTO public.sys_health_events(event_type, severity, details)
        VALUES ('stale_view', 'info', 'Sales stream older than 10 minutes');
        v_count := v_count + 1;
    END IF;

    RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_analyze_system_health() OWNER TO postgres;

--
-- TOC entry 717 (class 1255 OID 22442)
-- Name: fn_apply_autoscale(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_apply_autoscale() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_latest RECORD;
  v_action TEXT;
BEGIN
  SELECT * INTO v_latest
  FROM public.ai_scaling_predictions
  ORDER BY created_at DESC LIMIT 1;

  IF NOT FOUND THEN
    RAISE NOTICE 'ℹ️ No predictions found, skipping scaling.';
    RETURN;
  END IF;

  -- Decision logic
  IF v_latest.predicted_cpu_load > 80 OR v_latest.predicted_memory_gb > 50 THEN
    v_action := 'scale_up';
  ELSIF v_latest.predicted_cpu_load < 20 AND v_latest.predicted_memory_gb < 10 THEN
    v_action := 'scale_down';
  ELSE
    v_action := 'maintain';
  END IF;

  -- ✅ FIXED: use PostgreSQL-safe %s substitution
  INSERT INTO public.ai_resource_actions(
    action_type, target_component, decision_reason, expected_impact, confidence
  )
  VALUES (
    v_action,
    'database',
    format('Predicted CPU %s%% / MEM %s GB',
           ROUND(v_latest.predicted_cpu_load, 2),
           ROUND(v_latest.predicted_memory_gb, 2)),
    CASE v_action
      WHEN 'scale_up' THEN 'Increase capacity to prevent latency.'
      WHEN 'scale_down' THEN 'Reduce cost due to low utilization.'
      ELSE 'Maintain stable configuration.'
    END,
    v_latest.confidence
  );

  RAISE NOTICE '⚙️ Auto-scale action decided: %', v_action;
END;
$$;


ALTER FUNCTION public.fn_apply_autoscale() OWNER TO postgres;

--
-- TOC entry 695 (class 1255 OID 21374)
-- Name: fn_apply_retention_policy(bigint, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_apply_retention_policy(p_tenant_id bigint, p_table_name text, p_days integer DEFAULT NULL::integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_days INT;
  v_sql TEXT;
  v_rows INT;
BEGIN
  -- get policy days
  SELECT COALESCE(p_days, data_retention_days)
  INTO v_days
  FROM public.tenant_policies
  WHERE tenant_id = p_tenant_id;

  IF v_days IS NULL THEN
    RAISE NOTICE '⚠️ No retention policy found for tenant %', p_tenant_id;
    RETURN;
  END IF;

  -- build SQL WITHOUT the stray semicolon
  v_sql := format(
    'DELETE FROM public.%I WHERE tenant_id = %L AND created_at < now() - interval ''%s days'' RETURNING *',
    p_table_name, p_tenant_id, v_days
  );

  -- execute and count deleted rows
  EXECUTE format('WITH deleted AS (%s) SELECT count(*) FROM deleted', v_sql)
  INTO v_rows;

  -- log retention job
  INSERT INTO public.data_retention_jobs(
    tenant_id, table_name, action_type, affected_rows, executed_at, status, notes
  )
  VALUES (
    p_tenant_id,
    p_table_name,
    'purge',
    COALESCE(v_rows, 0),
    now(),
    'success',
    format('Purged %s rows older than %s days', v_rows, v_days)
  );
END;
$$;


ALTER FUNCTION public.fn_apply_retention_policy(p_tenant_id bigint, p_table_name text, p_days integer) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 19387)
-- Name: fn_audit_change(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_audit_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_old jsonb;
  v_new jsonb;
  v_record_id bigint;
BEGIN
  IF TG_OP = 'DELETE' THEN
    v_old := to_jsonb(OLD);
    v_new := NULL;
    v_record_id := (OLD->>'id')::bigint;
    IF v_record_id IS NULL THEN
      -- try common names
      v_record_id := COALESCE((OLD->>'order_id')::bigint, (OLD->>'product_id')::bigint, (OLD->>'user_id')::bigint, (OLD->>'payment_id')::bigint);
    END IF;
    INSERT INTO public.audit_trail(table_name, record_id, action, old_data, new_data, created_at)
      VALUES (TG_TABLE_NAME, v_record_id, 'DELETE', v_old, v_new, now());
    RETURN OLD;
  ELSIF TG_OP = 'UPDATE' THEN
    v_old := to_jsonb(OLD);
    v_new := to_jsonb(NEW);
    v_record_id := COALESCE((NEW->>'id')::bigint, (NEW->>'order_id')::bigint, (NEW->>'product_id')::bigint, (NEW->>'user_id')::bigint, (NEW->>'payment_id')::bigint);
    INSERT INTO public.audit_trail(table_name, record_id, action, old_data, new_data, created_at)
      VALUES (TG_TABLE_NAME, v_record_id, 'UPDATE', v_old, v_new, now());
    RETURN NEW;
  ELSIF TG_OP = 'INSERT' THEN
    v_old := NULL;
    v_new := to_jsonb(NEW);
    v_record_id := COALESCE((NEW->>'id')::bigint, (NEW->>'order_id')::bigint, (NEW->>'product_id')::bigint, (NEW->>'user_id')::bigint, (NEW->>'payment_id')::bigint);
    INSERT INTO public.audit_trail(table_name, record_id, action, old_data, new_data, created_at)
      VALUES (TG_TABLE_NAME, v_record_id, 'INSERT', v_old, v_new, now());
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.fn_audit_change() OWNER TO postgres;

--
-- TOC entry 711 (class 1255 OID 22301)
-- Name: fn_audit_set_signature(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_audit_set_signature() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.signature := md5(
        coalesce(NEW.event_type, '') ||
        coalesce(NEW.table_name, '') ||
        coalesce(NEW.record_id::TEXT, '') ||
        coalesce(NEW.created_at::TEXT, '')
    );
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_audit_set_signature() OWNER TO postgres;

--
-- TOC entry 794 (class 1255 OID 21329)
-- Name: fn_auto_learn_from_outcomes(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_auto_learn_from_outcomes(p_window_days integer DEFAULT 30, p_model_name text DEFAULT 'rfm_churn_v1'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE wr NUMERIC; wf NUMERIC; wm NUMERIC; total NUMERIC;
        conv_high NUMERIC; conv_med NUMERIC;
BEGIN
  PERFORM public.fn_init_default_churn_weights();
  SELECT w_recency, w_frequency, w_monetary INTO wr, wf, wm
  FROM public.ai_churn_feature_weights WHERE model_name = p_model_name;

  PERFORM public.fn_compute_uplift_metrics(p_window_days);
  SELECT AVG(conversion_rate) FILTER (WHERE churn_risk='high'),
         AVG(conversion_rate) FILTER (WHERE churn_risk='medium')
  INTO conv_high, conv_med
  FROM public.ai_uplift_metrics
  WHERE calculated_at >= now() - make_interval(days => 1);

  IF conv_high IS NOT NULL AND conv_med IS NOT NULL AND conv_high < conv_med THEN
    wr := GREATEST(wr - 0.03, 0.05);
    wm := LEAST(wm + 0.03, 0.80);
  ELSE
    wr := LEAST(wr + 0.02, 0.80);
    wf := LEAST(wf + 0.01, 0.80);
    wm := GREATEST(1.0 - (wr + wf), 0.10);
  END IF;

  total := NULLIF(wr + wf + wm, 0);
  wr := wr / total; wf := wf / total; wm := wm / total;

  UPDATE public.ai_churn_feature_weights
  SET w_recency = wr, w_frequency = wf, w_monetary = wm, updated_at = now()
  WHERE model_name = p_model_name;

  INSERT INTO public.ai_learning_events(model_name, notes, details, created_at)
  VALUES (p_model_name, 'Auto-learn weight update from outcomes',
          jsonb_build_object('w_recency', wr, 'w_frequency', wf, 'w_monetary', wm,
                             'conv_high', conv_high, 'conv_med', conv_med),
          now());
END;
$$;


ALTER FUNCTION public.fn_auto_learn_from_outcomes(p_window_days integer, p_model_name text) OWNER TO postgres;

--
-- TOC entry 716 (class 1255 OID 20784)
-- Name: fn_auto_maintenance(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_auto_maintenance() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN PERFORM public.refresh_financial_summary(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skip financial_summary'; END;
  BEGIN PERFORM public.refresh_sales_forecast(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skip sales_forecast'; END;
  BEGIN PERFORM public.refresh_product_conversion_stats(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skip product_conversion_stats'; END;
  BEGIN PERFORM public.fn_check_low_stock(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skip fn_check_low_stock'; END;
END;
$$;


ALTER FUNCTION public.fn_auto_maintenance() OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 22132)
-- Name: fn_auto_manage_webhooks(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_auto_manage_webhooks() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE v_disabled INT := 0;
BEGIN
    UPDATE public.rt_webhook_endpoints e
    SET is_active = FALSE
    FROM public.ai_webhook_health h
    WHERE e.webhook_id = h.webhook_id
      AND h.status = 'critical'
      AND e.is_active = TRUE;
    GET DIAGNOSTICS v_disabled = ROW_COUNT;
    RETURN v_disabled;
END;
$$;


ALTER FUNCTION public.fn_auto_manage_webhooks() OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 22152)
-- Name: fn_auto_recover_system(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_auto_recover_system() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE v_actions INT := 0;
BEGIN
    -- Attempt to republish old pending outbox events
    PERFORM public.fn_publish_outbox(500);
    v_actions := v_actions + 1;

    -- Retry failed webhooks
    PERFORM public.fn_process_webhook_queue(100);
    v_actions := v_actions + 1;

    -- Refresh materialized views
    PERFORM public.fn_refresh_stream_sales_5m();
    v_actions := v_actions + 1;

    INSERT INTO public.sys_health_events(event_type, severity, details, resolution_action)
    VALUES ('auto_fix', 'info', 'Ran republish, retry, refresh', 'system_self_heal');
    RETURN v_actions;
END;
$$;


ALTER FUNCTION public.fn_auto_recover_system() OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 21808)
-- Name: fn_auto_tune_policy_from_simulation(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_auto_tune_policy_from_simulation(p_tenant_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_avg_delta NUMERIC;
BEGIN
  SELECT AVG(delta_percent) INTO v_avg_delta
  FROM public.ai_simulation_results r
  JOIN public.ai_simulation_runs s ON r.run_id = s.run_id
  WHERE s.tenant_id = p_tenant_id AND s.status = 'completed';

  IF v_avg_delta IS NOT NULL THEN
    UPDATE public.ai_decision_policies
    SET weight_factor = COALESCE(weight_factor,1) * (1 - v_avg_delta/100)
    WHERE tenant_id = p_tenant_id;

    RAISE NOTICE '⚙️ Policies tuned using simulation feedback (avg delta %.2f%%).', v_avg_delta;
  END IF;
END;
$$;


ALTER FUNCTION public.fn_auto_tune_policy_from_simulation(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 21909)
-- Name: fn_broadcast_global_model(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_broadcast_global_model(p_model_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_model JSONB;
BEGIN
  SELECT parameters INTO v_model FROM public.ai_global_model_registry WHERE model_id = p_model_id;
  IF v_model IS NULL THEN
    RAISE EXCEPTION 'Global model % not found', p_model_id;
  END IF;

  UPDATE public.ai_strategy_versions
  SET parameters = jsonb_set(parameters, '{global_sync}', v_model)
  WHERE is_active = TRUE;

  RAISE NOTICE '📡 Global model % broadcast to active tenant strategies.', p_model_id;
END;
$$;


ALTER FUNCTION public.fn_broadcast_global_model(p_model_id bigint) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 20941)
-- Name: fn_build_kpi_forecast(date, date, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_build_kpi_forecast(p_from date, p_to date, p_window_days integer DEFAULT 60, p_z numeric DEFAULT 1.96) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF p_from IS NULL OR p_to IS NULL OR p_from > p_to THEN
    RAISE EXCEPTION 'Invalid date range for fn_build_kpi_forecast(%,%)', p_from, p_to;
  END IF;

  WITH hist AS (
    SELECT
      tenant_id,
      snapshot_date,
      kpi_name,
      kpi_value
    FROM public.v_kpi_unpivot
    WHERE snapshot_date >= (p_from - make_interval(days => p_window_days))
      AND snapshot_date <= p_to
      AND kpi_value IS NOT NULL
  ),
  base AS (
    SELECT
      tenant_id,
      kpi_name,
      snapshot_date,
      kpi_value,
      MIN(snapshot_date) OVER (PARTITION BY tenant_id, kpi_name) AS min_date
    FROM hist
  ),
  xformed AS (
    SELECT
      tenant_id,
      kpi_name,
      snapshot_date,
      kpi_value,
      EXTRACT(EPOCH FROM ((snapshot_date - min_date) * INTERVAL '1 day')) / 86400.0 AS t
    FROM base
  ),
  linreg AS (
    SELECT
      tenant_id,
      kpi_name,
      MIN(snapshot_date) AS min_date,
      MAX(snapshot_date) AS max_date,
      REGR_SLOPE(kpi_value, t) AS slope,
      REGR_INTERCEPT(kpi_value, t) AS intercept
    FROM xformed
    GROUP BY tenant_id, kpi_name
  ),
  residuals AS (
    SELECT
      x.tenant_id,
      x.kpi_name,
      STDDEV_POP(x.kpi_value - (l.slope * x.t + l.intercept)) AS resid_std
    FROM xformed x
    JOIN linreg l USING (tenant_id, kpi_name)
    GROUP BY x.tenant_id, x.kpi_name
  ),
  stats AS (
    SELECT
      l.tenant_id,
      l.kpi_name,
      l.min_date,
      l.max_date,
      l.slope,
      l.intercept,
      r.resid_std
    FROM linreg l
    LEFT JOIN residuals r USING (tenant_id, kpi_name)
  ),
  targets AS (
    SELECT generate_series(p_from, p_to, INTERVAL '1 day')::date AS forecast_date
  ),
  series AS (
    SELECT s.tenant_id, s.kpi_name, t.forecast_date,
           EXTRACT(EPOCH FROM ((t.forecast_date - s.min_date) * INTERVAL '1 day')) / 86400.0 AS t_future,
           s.slope, s.intercept, s.resid_std
    FROM stats s
    CROSS JOIN targets t
  )
  INSERT INTO public.kpi_forecast AS kf (forecast_date, tenant_id, kpi_name, forecast_value, lower_band, upper_band, method, created_at)
  SELECT
    forecast_date,
    tenant_id,
    kpi_name,
    (slope * t_future + intercept) AS forecast_value,
    (slope * t_future + intercept) - COALESCE(p_z * resid_std, 0) AS lower_band,
    (slope * t_future + intercept) + COALESCE(p_z * resid_std, 0) AS upper_band,
    'linreg_rolling' AS method,
    now()
  FROM series
  WHERE slope IS NOT NULL AND intercept IS NOT NULL
  ON CONFLICT (forecast_date, tenant_id, kpi_name)
  DO UPDATE SET
    forecast_value = EXCLUDED.forecast_value,
    lower_band     = EXCLUDED.lower_band,
    upper_band     = EXCLUDED.upper_band,
    method         = EXCLUDED.method,
    created_at     = now();
END;
$$;


ALTER FUNCTION public.fn_build_kpi_forecast(p_from date, p_to date, p_window_days integer, p_z numeric) OWNER TO postgres;

--
-- TOC entry 735 (class 1255 OID 20814)
-- Name: fn_build_product_recommendations(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_build_product_recommendations(p_topk integer DEFAULT 10) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Use co_purchase_count as score for now.
  WITH ranked AS (
    SELECT
      pa.product_id_a AS product_id,
      pa.product_id_b AS recommended_product_id,
      pa.co_purchase_count::numeric(10,4) AS score,
      ROW_NUMBER() OVER (PARTITION BY pa.product_id_a ORDER BY pa.co_purchase_count DESC) AS rnk
    FROM public.product_affinity pa
    UNION ALL
    SELECT
      pa.product_id_b AS product_id,
      pa.product_id_a AS recommended_product_id,
      pa.co_purchase_count::numeric(10,4) AS score,
      ROW_NUMBER() OVER (PARTITION BY pa.product_id_b ORDER BY pa.co_purchase_count DESC) AS rnk
    FROM public.product_affinity pa
  )
  INSERT INTO public.product_recommendations AS pr (product_id, recommended_product_id, score, reason, last_updated)
  SELECT product_id, recommended_product_id, score, 'co_purchase', now()
  FROM ranked
  WHERE rnk <= p_topk
  ON CONFLICT (product_id, recommended_product_id)
  DO UPDATE SET score = EXCLUDED.score, reason = EXCLUDED.reason, last_updated = now();
END;
$$;


ALTER FUNCTION public.fn_build_product_recommendations(p_topk integer) OWNER TO postgres;

--
-- TOC entry 779 (class 1255 OID 20834)
-- Name: fn_build_user_recommendations(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_build_user_recommendations(p_days integer DEFAULT 14, p_topk integer DEFAULT 20) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  WITH recent_views AS (
    SELECT user_id, product_id, MAX(created_at) AS last_view_at
    FROM public.user_activity_logs
    WHERE action = 'view' AND created_at >= now() - make_interval(days => p_days)
    GROUP BY user_id, product_id
  ),
  candidate_recs AS (
    SELECT rv.user_id, pr.recommended_product_id, MAX(pr.score) AS score
    FROM recent_views rv
    JOIN public.product_recommendations pr ON pr.product_id = rv.product_id
    GROUP BY rv.user_id, pr.recommended_product_id
  ),
  ranked AS (
    SELECT
      cr.user_id, cr.recommended_product_id, cr.score,
      ROW_NUMBER() OVER (PARTITION BY cr.user_id ORDER BY cr.score DESC) AS rnk
    FROM candidate_recs cr
  )
  INSERT INTO public.user_recommendations AS ur (user_id, recommended_product_id, score, reason, last_updated)
  SELECT user_id, recommended_product_id, score, 'recent_views_x_affinity', now()
  FROM ranked
  WHERE rnk <= p_topk
  ON CONFLICT (user_id, recommended_product_id)
  DO UPDATE SET score = EXCLUDED.score, reason = EXCLUDED.reason, last_updated = now();
END;
$$;


ALTER FUNCTION public.fn_build_user_recommendations(p_days integer, p_topk integer) OWNER TO postgres;

--
-- TOC entry 739 (class 1255 OID 21019)
-- Name: fn_check_alert_rules(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_check_alert_rules(p_days_back integer DEFAULT 1) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  r RECORD;
  e RECORD;
BEGIN
  FOR r IN
    SELECT * FROM public.alert_rules
    WHERE active = TRUE
  LOOP
    FOR e IN
      SELECT * FROM public.kpi_explainability_logs
      WHERE snapshot_date >= (now()::date - p_days_back)
        AND severity >= r.severity_min
        AND (r.kpi_name IS NULL OR r.kpi_name = kpi_name)
        AND (r.tenant_id IS NULL OR r.tenant_id = tenant_id)
    LOOP
      PERFORM public.fn_enqueue_alert(
        r.rule_id,
        e.tenant_id,
        e.snapshot_date,
        e.kpi_name,
        e.severity,
        e.reason_summary,
        jsonb_build_object(
          'observed_value', e.observed_value,
          'expected_value', e.expected_value,
          'deviation_pct', e.deviation_pct,
          'correlation', e.correlation,
          'related_kpi', e.related_kpi
        )
      );
    END LOOP;
  END LOOP;
END;
$$;


ALTER FUNCTION public.fn_check_alert_rules(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 22589)
-- Name: fn_check_compliance(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_check_compliance() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_count INT := 0;
  r RECORD;
  v_has_audit BOOL := FALSE;
BEGIN
  -- 3.1 RLS enabled for sensitive tables (orders, users, payments if exist)
  FOR r IN
    SELECT c.relname AS tbl
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname='public'
      AND c.relkind='r'
      AND c.relname IN ('orders','users','payments')
  LOOP
    IF NOT EXISTS (
      SELECT 1 FROM pg_class c
      WHERE c.relname = r.tbl AND c.relrowsecurity = true
    ) THEN
      PERFORM fn__log_finding('rls','public',r.tbl,'critical',
        'Row Level Security is OFF',
        'Enable RLS: ALTER TABLE public.'||r.tbl||' ENABLE ROW LEVEL SECURITY;',
        TRUE);
      v_count := v_count + 1;
    END IF;
  END LOOP;

  -- 3.2 Tenant isolation policy present (if column tenant_id exists)
  FOR r IN
    SELECT table_name AS tbl
    FROM information_schema.columns
    WHERE table_schema='public' AND column_name='tenant_id'
    GROUP BY table_name
  LOOP
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies p
      WHERE p.schemaname='public' AND p.tablename=r.tbl AND p.policyname='tenant_isolation_policy'
    ) THEN
      PERFORM fn__log_finding('policy','public',r.tbl,'critical',
        'Missing tenant_isolation_policy',
        'CREATE POLICY tenant_isolation_policy ON public.'||r.tbl||' USING (tenant_id = current_setting(''app.tenant_id'')::bigint);',
        TRUE);
      v_count := v_count + 1;
    END IF;
  END LOOP;

  -- 3.3 Critical triggers exist (outbox/audit if those functions exist)
  BEGIN
    IF EXISTS (SELECT 1 FROM pg_proc WHERE proname='fn_publish_outbox') THEN
      IF NOT EXISTS (
        SELECT 1 FROM pg_trigger t JOIN pg_class c ON t.tgrelid=c.oid
        WHERE c.relname='rt_event_outbox' AND t.tgname='trg_outbox_updated'
      ) THEN
        PERFORM fn__log_finding('trigger','public','rt_event_outbox','warning',
          'Outbox trigger missing',
          'Recreate trigger to publish outbox events.',
          TRUE);
        v_count := v_count + 1;
      END IF;
    END IF;
  EXCEPTION WHEN OTHERS THEN NULL; END;

  -- 3.4 Audit logging present
  PERFORM 1 FROM information_schema.tables
   WHERE table_schema='public' AND table_name='sys_audit_log';
  IF FOUND THEN
    v_has_audit := TRUE;
  ELSE
    PERFORM fn__log_finding('audit','public','sys_audit_log','warning',
      'Audit ledger table missing',
      'Create sys_audit_log and attach triggers on users/orders/payments.',
      FALSE);
    v_count := v_count + 1;
  END IF;

  -- 3.5 Retention policy function exists (optional)
  IF NOT EXISTS (SELECT 1 FROM pg_proc WHERE proname='fn_apply_retention_policy') THEN
    PERFORM fn__log_finding('retention','public','fn_apply_retention_policy','info',
      'Retention function missing',
      'Provide data lifecycle policy to purge stale rows.',
      FALSE);
    v_count := v_count + 1;
  END IF;

  -- 3.6 Stale MVs (mv_stream_sales_5m) using last row timestamp check
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='mv_stream_sales_5m') THEN
    IF (SELECT COALESCE(MAX(sale_minute), 'epoch'::timestamptz) < now() - interval '15 minutes'
        FROM public.mv_stream_sales_5m) THEN
      PERFORM fn__log_finding('mv','public','mv_stream_sales_5m','warning',
        'Sales stream MV stale (>15m)',
        'Refresh materialized view',
        TRUE);
      v_count := v_count + 1;
    END IF;
  END IF;

  -- 3.7 Privilege drift on public schema: detect tables with PUBLIC write grants
  FOR r IN
    SELECT c.relname AS tbl
    FROM pg_class c
    JOIN pg_namespace n ON n.oid=c.relnamespace
    WHERE n.nspname='public' AND c.relkind='r'
  LOOP
    IF EXISTS (
      SELECT 1
      FROM information_schema.role_table_grants g
      WHERE g.table_schema='public' AND g.table_name=r.tbl
        AND g.grantee='PUBLIC' AND g.privilege_type IN ('INSERT','UPDATE','DELETE')
    ) THEN
      PERFORM fn__log_finding('privilege','public',r.tbl,'critical',
        'PUBLIC has write privileges',
        'REVOKE INSERT, UPDATE, DELETE ON public.'||r.tbl||' FROM PUBLIC;',
        TRUE);
      v_count := v_count + 1;
    END IF;
  END LOOP;

  RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_check_compliance() OWNER TO postgres;

--
-- TOC entry 774 (class 1255 OID 19941)
-- Name: fn_check_low_stock(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_check_low_stock(threshold_value integer DEFAULT 10) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.inventory_alerts (product_id, current_stock, threshold, created_at)
  SELECT v.product_id, v.current_stock::int, threshold_value, now()
  FROM public.v_product_stock v
  WHERE v.current_stock <= threshold_value
    AND NOT EXISTS (
      SELECT 1 FROM public.inventory_alerts a WHERE a.product_id = v.product_id AND a.resolved = false
    );
END;
$$;


ALTER FUNCTION public.fn_check_low_stock(threshold_value integer) OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 22652)
-- Name: fn_collect_enterprise_kpi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_collect_enterprise_kpi() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_rev NUMERIC := 0;
  v_orders BIGINT := 0;
  v_users BIGINT := 0;
  v_aov NUMERIC := 0;
  v_acc NUMERIC := 0;
  v_conf NUMERIC := 0;
  v_alerts INT := 0;
  v_escal INT := 0;
  v_find INT := 0;
  v_gov NUMERIC := 0;
  v_index NUMERIC := 0;
BEGIN
  -- 24h revenue/orders
  SELECT COALESCE(SUM(amount),0), COUNT(*)
    INTO v_rev, v_orders
    FROM public.payments
    WHERE created_at > now() - interval '24 hours';

  -- 24h new users
  SELECT COUNT(*) INTO v_users
    FROM public.users WHERE created_at > now() - interval '24 hours';

  -- Avg order value
  IF v_orders > 0 THEN
    v_aov := ROUND(v_rev / v_orders, 2);
  END IF;

  -- AI performance snapshot
  SELECT AVG(avg_accuracy), AVG(avg_reward)
    INTO v_acc, v_conf
    FROM public.ai_model_performance;

  -- Alerts & escalations
  SELECT COUNT(*) INTO v_alerts FROM public.ai_budget_alerts WHERE resolved = FALSE;
  SELECT COUNT(*) INTO v_escal FROM public.ai_alert_escalations WHERE status <> 'success';

  -- Compliance & governance
  SELECT COUNT(*) INTO v_find FROM public.sys_compliance_findings WHERE fixed = FALSE;
  SELECT COALESCE(AVG(governance_score),0) INTO v_gov FROM public.sys_ops_governance;

  -- Composite enterprise index (0-1000)
  v_index := ROUND(
      (COALESCE(v_gov,0) * 3) +
      (LEAST(500, v_rev/1000)) +
      (100 - LEAST(v_alerts*5,50)) +
      (COALESCE(v_conf*10,0))
    ,2);

  INSERT INTO public.sys_enterprise_kpi(
    tenant_id, revenue_24h, orders_24h, new_users_24h,
    avg_aov, ai_accuracy, ai_confidence,
    alerts_open, escalations_open, compliance_findings,
    governance_score, enterprise_index)
  VALUES (1, v_rev, v_orders, v_users, v_aov,
          v_acc, v_conf, v_alerts, v_escal, v_find, v_gov, v_index);

  RAISE NOTICE '✅ Enterprise KPI snapshot collected (Index=%)', v_index;
END;
$$;


ALTER FUNCTION public.fn_collect_enterprise_kpi() OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 22559)
-- Name: fn_collect_ops_snapshot(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_collect_ops_snapshot() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v RECORD;
  v_cpu NUMERIC := 0;
  v_mem NUMERIC := 0;
  v_alerts INT := 0;
  v_escal INT := 0;
  v_margin NUMERIC := 0;
  v_cost NUMERIC := 0;
  v_rev NUMERIC := 0;
  v_acc NUMERIC := 0;
  v_conf NUMERIC := 0;
  v_aud INT := 0;
  v_score NUMERIC;
BEGIN
  -- Metrics from predictive layer
  SELECT AVG(predicted_cpu_load), AVG(predicted_memory_gb)
    INTO v_cpu, v_mem
    FROM public.ai_scaling_predictions;

  -- Unresolved alerts & escalations
  SELECT COUNT(*) INTO v_alerts FROM public.ai_budget_alerts WHERE resolved IS FALSE;
  SELECT COUNT(*) INTO v_escal FROM public.ai_alert_escalations WHERE status <> 'success';

  -- Cost / revenue snapshot
  SELECT AVG(margin), AVG(infra_cost + ai_cost), AVG(revenue)
    INTO v_margin, v_cost, v_rev
    FROM public.ai_cost_forecasts;

  -- AI model performance snapshot (avg_reward used as confidence)
  SELECT AVG(avg_accuracy), AVG(avg_reward)
    INTO v_acc, v_conf
    FROM public.ai_model_performance
    WHERE model_type IS NOT NULL;

  -- Audit event count
  BEGIN
    SELECT COUNT(*) INTO v_aud FROM public.sys_audit_log;
  EXCEPTION WHEN undefined_table THEN
    v_aud := 0;
  END;

  -- Derive governance score
  v_score := ROUND(
      (COALESCE(v_margin,0) / GREATEST(v_cost,1)) * 30 +
      (100 - LEAST(v_alerts*5,50)) +
      COALESCE(v_conf*10,0) +
      (100 - LEAST(v_escal*10,30)) , 2);

  INSERT INTO public.sys_ops_governance(
    tenant_id, cpu_load, memory_gb,
    active_alerts, unresolved_escalations,
    avg_margin, avg_cost, avg_revenue,
    ai_accuracy, ai_confidence, audit_events, governance_score)
  VALUES (1, v_cpu, v_mem, v_alerts, v_escal, v_margin, v_cost, v_rev, v_acc, v_conf, v_aud, v_score);

  RAISE NOTICE '✅ Governance snapshot inserted with score %', v_score;
END;
$$;


ALTER FUNCTION public.fn_collect_ops_snapshot() OWNER TO postgres;

--
-- TOC entry 791 (class 1255 OID 22395)
-- Name: fn_collect_system_metrics(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_collect_system_metrics() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_order_count BIGINT;
    v_user_count BIGINT;
    v_avg_order_value NUMERIC;
BEGIN
    -- Attempt to pull live metrics (handle missing tables gracefully)
    BEGIN
        EXECUTE 'SELECT COUNT(*), AVG(total_amount) FROM public.orders'
        INTO v_order_count, v_avg_order_value;
    EXCEPTION WHEN OTHERS THEN
        v_order_count := 0;
        v_avg_order_value := 0;
    END;

    BEGIN
        EXECUTE 'SELECT COUNT(*) FROM public.users'
        INTO v_user_count;
    EXCEPTION WHEN OTHERS THEN
        v_user_count := 0;
    END;

    -- Write metrics safely
    INSERT INTO public.sys_metrics(metric_name, metric_value)
    VALUES 
        ('orders_count', COALESCE(v_order_count,0)),
        ('users_count', COALESCE(v_user_count,0)),
        ('avg_order_value', COALESCE(v_avg_order_value,0));

    PERFORM public.fn_update_heartbeat('metrics_collector', 5);
    RAISE NOTICE '✅ fn_collect_system_metrics executed successfully.';
END;
$$;


ALTER FUNCTION public.fn_collect_system_metrics() OWNER TO postgres;

--
-- TOC entry 761 (class 1255 OID 21807)
-- Name: fn_compare_forecast_vs_simulation(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compare_forecast_vs_simulation(p_run_id bigint) RETURNS TABLE(kpi_name text, deviation numeric, deviation_pct numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT r.kpi_name::TEXT AS kpi_name,  -- ✅ Explicit cast to TEXT
         (r.simulated_value - r.base_value) AS deviation,
         ROUND(((r.simulated_value - r.base_value) / NULLIF(r.base_value, 0)) * 100, 2) AS deviation_pct
  FROM public.ai_simulation_results r
  WHERE r.run_id = p_run_id;
END;
$$;


ALTER FUNCTION public.fn_compare_forecast_vs_simulation(p_run_id bigint) OWNER TO postgres;

--
-- TOC entry 780 (class 1255 OID 21258)
-- Name: fn_compute_churn_predictions(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compute_churn_predictions(p_days_back integer DEFAULT 90) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_churn_predictions (user_id, tenant_id, churn_probability, churn_risk, last_activity, recency_days, frequency_30d, monetary_90d, reason, created_at)
  SELECT
    u.user_id,
    u.tenant_id,
    ROUND(
      LEAST(1.0,
        0.4 * (EXTRACT(DAY FROM (now() - MAX(o.created_at))) / p_days_back)::numeric +
        0.3 * (1 - (COUNT(DISTINCT o.order_id) / GREATEST(1, COUNT(DISTINCT o.order_id) + 10))) +
        0.3 * (1 - (COALESCE(SUM(p.amount), 0) / GREATEST(1, SUM(p.amount) + 500)))
      ), 4
    ) AS churn_probability,
    CASE
      WHEN (EXTRACT(DAY FROM (now() - MAX(o.created_at))) > 90 OR COUNT(DISTINCT o.order_id) < 2) THEN 'high'
      WHEN (EXTRACT(DAY FROM (now() - MAX(o.created_at))) BETWEEN 30 AND 90) THEN 'medium'
      ELSE 'low'
    END AS churn_risk,
    MAX(o.created_at) AS last_activity,
    EXTRACT(DAY FROM (now() - MAX(o.created_at)))::int AS recency_days,
    COUNT(*) FILTER (WHERE o.created_at >= now() - INTERVAL '30 days')::numeric AS frequency_30d,
    COALESCE(SUM(p.amount) FILTER (WHERE o.created_at >= now() - INTERVAL '90 days'), 0)::numeric AS monetary_90d,
    'Computed using RFM churn heuristic model.',
    now()
  FROM public.users u
  LEFT JOIN public.orders o ON u.user_id = o.user_id
  LEFT JOIN public.payments p ON o.order_id = p.order_id
  GROUP BY u.user_id, u.tenant_id
  ON CONFLICT (user_id) DO UPDATE SET
    churn_probability = EXCLUDED.churn_probability,
    churn_risk = EXCLUDED.churn_risk,
    last_activity = EXCLUDED.last_activity,
    recency_days = EXCLUDED.recency_days,
    frequency_30d = EXCLUDED.frequency_30d,
    monetary_90d = EXCLUDED.monetary_90d,
    reason = EXCLUDED.reason,
    created_at = now();
END;
$$;


ALTER FUNCTION public.fn_compute_churn_predictions(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 788 (class 1255 OID 20910)
-- Name: fn_compute_daily_kpis(date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compute_daily_kpis(p_from date, p_to date) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  d DATE;
BEGIN
  IF p_from IS NULL OR p_to IS NULL OR p_from > p_to THEN
    RAISE EXCEPTION 'Invalid date range for fn_compute_daily_kpis(%,%)', p_from, p_to;
  END IF;

  d := p_from;
  WHILE d <= p_to LOOP
    INSERT INTO public.kpi_daily_snapshot AS k (
      snapshot_date, tenant_id, total_orders, total_revenue, total_refunds,
      net_revenue, new_users, purchasers, repeat_customers, repeat_rate, aov, created_at
    )
    SELECT
      d AS snapshot_date,
      t.tenant_id,
      COUNT(DISTINCT o.order_id) AS total_orders,
      COALESCE(SUM(p.amount), 0)::numeric(18,2) AS total_revenue,
      COALESCE(SUM(rf.amount), 0)::numeric(18,2) AS total_refunds,
      (COALESCE(SUM(p.amount),0) - COALESCE(SUM(rf.amount),0))::numeric(18,2) AS net_revenue,
      COALESCE(new_users_ct.new_users,0) AS new_users,
      COUNT(DISTINCT o.user_id) AS purchasers,
      COALESCE(SUM(CASE WHEN user_order_counts.order_count > 1 THEN 1 ELSE 0 END),0) AS repeat_customers,
      CASE WHEN COUNT(DISTINCT o.user_id) > 0
           THEN ROUND((SUM(CASE WHEN user_order_counts.order_count > 1 THEN 1 ELSE 0 END)::numeric /
                      COUNT(DISTINCT o.user_id)::numeric), 3)
           ELSE NULL END AS repeat_rate,
      CASE WHEN COUNT(DISTINCT o.order_id) > 0
           THEN ROUND(SUM(p.amount) / COUNT(DISTINCT o.order_id)::numeric, 2)
           ELSE NULL END AS aov,
      now()
    FROM (
      SELECT DISTINCT COALESCE(tenant_id, 1) AS tenant_id FROM public.orders
    ) t
    LEFT JOIN public.orders o
      ON COALESCE(o.tenant_id, 1) = t.tenant_id
     AND COALESCE(o.created_at::date, now()::date) = d
    LEFT JOIN public.payments p
      ON p.order_id = o.order_id
     AND COALESCE(p.paid_at, o.created_at)::date = d
    LEFT JOIN public.refunds rf
      ON rf.payment_id = p.payment_id
     AND rf.created_at::date = d
    LEFT JOIN LATERAL (
      SELECT o2.user_id, COUNT(*) AS order_count
      FROM public.orders o2
      WHERE o2.user_id = o.user_id
        AND o2.created_at::date <= d
        AND COALESCE(o2.tenant_id,1) = COALESCE(o.tenant_id,1)
      GROUP BY o2.user_id
    ) AS user_order_counts ON true
    LEFT JOIN LATERAL (
      SELECT COUNT(*) AS new_users
      FROM public.users u
      WHERE u.created_at::date = d
        AND COALESCE(u.tenant_id,1) = t.tenant_id
    ) AS new_users_ct ON true
    GROUP BY t.tenant_id, new_users_ct.new_users
    ON CONFLICT (snapshot_date, tenant_id) DO UPDATE SET
      total_orders   = EXCLUDED.total_orders,
      total_revenue  = EXCLUDED.total_revenue,
      total_refunds  = EXCLUDED.total_refunds,
      net_revenue    = EXCLUDED.net_revenue,
      new_users      = EXCLUDED.new_users,
      purchasers     = EXCLUDED.purchasers,
      repeat_customers = EXCLUDED.repeat_customers,
      repeat_rate    = EXCLUDED.repeat_rate,
      aov            = EXCLUDED.aov,
      created_at     = now();

    d := d + INTERVAL '1 day';
  END LOOP;
END;
$$;


ALTER FUNCTION public.fn_compute_daily_kpis(p_from date, p_to date) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 21959)
-- Name: fn_compute_fairness_scores(bigint, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compute_fairness_scores(p_tenant_id bigint, p_model_type text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_ws TIMESTAMPTZ := now() - INTERVAL '7 days';
  v_we TIMESTAMPTZ := now();
  v_min NUMERIC;
  v_max NUMERIC;
  v_parity NUMERIC;
  v_opp_min NUMERIC;
  v_opp_max NUMERIC;
  v_opp NUMERIC;
  v_overall NUMERIC;
BEGIN
  -- Parity over avg_confidence by action_type
  SELECT MIN(metric_value), MAX(metric_value)
    INTO v_min, v_max
  FROM public.ai_bias_audit_results
  WHERE tenant_id = p_tenant_id AND model_type = p_model_type
    AND metric_name = 'avg_confidence'
    AND created_at >= v_ws;

  IF v_min IS NULL OR v_max IS NULL OR v_max = 0 THEN
    v_parity := NULL;
  ELSE
    v_parity := ROUND((v_min / v_max)::numeric, 4);
  END IF;

  -- Opportunity ratio over positive_rate
  SELECT MIN(metric_value), MAX(metric_value)
    INTO v_opp_min, v_opp_max
  FROM public.ai_bias_audit_results
  WHERE tenant_id = p_tenant_id AND model_type = p_model_type
    AND metric_name = 'positive_rate'
    AND created_at >= v_ws;

  IF v_opp_min IS NULL OR v_opp_max IS NULL OR v_opp_max = 0 THEN
    v_opp := NULL;
  ELSE
    v_opp := ROUND((v_opp_min / v_opp_max)::numeric, 4);
  END IF;

  IF v_parity IS NULL OR v_opp IS NULL THEN
    v_overall := NULL;
  ELSE
    v_overall := ROUND(((v_parity + v_opp) / 2)::numeric, 4);
  END IF;

  INSERT INTO public.ai_fairness_scores
    (tenant_id, model_type, parity_ratio, opportunity_ratio, overall_fairness, window_start, window_end, created_at)
  VALUES
    (p_tenant_id, p_model_type, v_parity, v_opp, v_overall, v_ws, v_we, now());
END;
$$;


ALTER FUNCTION public.fn_compute_fairness_scores(p_tenant_id bigint, p_model_type text) OWNER TO postgres;

--
-- TOC entry 700 (class 1255 OID 21753)
-- Name: fn_compute_market_impact(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compute_market_impact(p_tenant_id bigint) RETURNS TABLE(indicator_name text, correlation numeric, significance numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT t.indicator_name,
         ROUND(CORR(t.indicator_value, f.avg_reward)::NUMERIC, 4) AS correlation,
         ROUND(STDDEV_POP(t.indicator_value)::NUMERIC, 4) AS significance
  FROM public.ai_market_trends t
  JOIN public.ai_model_performance f ON TRUE
  WHERE f.tenant_id = p_tenant_id
  GROUP BY t.indicator_name
  ORDER BY ABS(CORR(t.indicator_value, f.avg_reward)) DESC NULLS LAST;
END;
$$;


ALTER FUNCTION public.fn_compute_market_impact(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 21327)
-- Name: fn_compute_uplift_metrics(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_compute_uplift_metrics(p_window_days integer DEFAULT 30) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_uplift_metrics(action_type, churn_risk, attempts, conversions, conversion_rate, avg_revenue, window_days, calculated_at)
  SELECT
    a.action_type,
    c.churn_risk,
    COUNT(*)::int AS attempts,
    SUM(CASE WHEN o.converted THEN 1 ELSE 0 END)::int AS conversions,
    CASE WHEN COUNT(*) > 0 THEN ROUND(AVG(CASE WHEN o.converted THEN 1.0 ELSE 0.0 END)::numeric, 4) ELSE 0 END AS conversion_rate,
    ROUND(COALESCE(AVG(o.revenue_after),0),2) AS avg_revenue,
    p_window_days,
    now()
  FROM public.ai_retention_actions a
  JOIN public.ai_churn_predictions c ON c.user_id = a.user_id
  LEFT JOIN public.ai_campaign_outcomes o ON o.action_id = a.action_id
  WHERE a.created_at >= now() - make_interval(days => p_window_days)
  GROUP BY a.action_type, c.churn_risk, p_window_days
  ON CONFLICT (action_type, churn_risk, window_days)
  DO UPDATE SET
    attempts = EXCLUDED.attempts,
    conversions = EXCLUDED.conversions,
    conversion_rate = EXCLUDED.conversion_rate,
    avg_revenue = EXCLUDED.avg_revenue,
    calculated_at = now();
END;
$$;


ALTER FUNCTION public.fn_compute_uplift_metrics(p_window_days integer) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 22504)
-- Name: fn_detect_cost_anomalies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_detect_cost_anomalies() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v RECORD;
  v_avg_cost NUMERIC;
  v_stddev NUMERIC;
BEGIN
  FOR v IN 
    SELECT tenant_id,
           AVG(infra_cost + ai_cost) AS avg_cost,
           STDDEV_POP(infra_cost + ai_cost) AS sd_cost
    FROM public.ai_cost_forecasts
    GROUP BY tenant_id
  LOOP
    v_avg_cost := COALESCE(v.avg_cost,0);
    v_stddev := COALESCE(v.sd_cost,0);

    INSERT INTO public.ai_budget_alerts(tenant_id, alert_type, message, severity)
    SELECT c.tenant_id, 
           CASE 
             WHEN (c.infra_cost + c.ai_cost) > (v_avg_cost + 2*v_stddev) THEN 'overspend'
             WHEN c.margin < 0 THEN 'negative_margin'
             ELSE 'normal'
           END,
           format('Cost anomaly detected: cost=%.2f margin=%.2f avg=%.2f', 
                   (c.infra_cost + c.ai_cost), c.margin, v_avg_cost),
           CASE 
             WHEN (c.infra_cost + c.ai_cost) > (v_avg_cost + 2*v_stddev) THEN 'critical'
             WHEN c.margin < 0 THEN 'warning'
             ELSE 'info'
           END
    FROM public.ai_cost_forecasts c
    WHERE c.tenant_id = v.tenant_id
      AND (c.infra_cost + c.ai_cost) > (v_avg_cost + 2*v_stddev)
      OR c.margin < 0;
  END LOOP;

  RAISE NOTICE '🚨 Cost anomaly detection complete.';
END;
$$;


ALTER FUNCTION public.fn_detect_cost_anomalies() OWNER TO postgres;

--
-- TOC entry 727 (class 1255 OID 21020)
-- Name: fn_dispatch_alerts(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_dispatch_alerts(p_limit integer DEFAULT 100) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE public.alert_queue
  SET status = 'sent', sent_at = now(), attempts = attempts + 1
  WHERE alert_id IN (
    SELECT alert_id FROM public.alert_queue
    WHERE status = 'pending'
    ORDER BY created_at ASC
    LIMIT p_limit
  );
END;
$$;


ALTER FUNCTION public.fn_dispatch_alerts(p_limit integer) OWNER TO postgres;

--
-- TOC entry 754 (class 1255 OID 21082)
-- Name: fn_dispatch_notifications(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_dispatch_notifications(p_limit integer DEFAULT 50) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  a RECORD;
  t RECORD;
  msg TEXT;
BEGIN
  FOR a IN
    SELECT q.*, r.channel, r.target_endpoint, r.rule_id
    FROM public.alert_queue q
    JOIN public.alert_rules r ON q.rule_id = r.rule_id
    WHERE q.status = 'pending'
    ORDER BY q.created_at ASC
    LIMIT p_limit
  LOOP
    SELECT * INTO t
    FROM public.notification_templates
    WHERE channel = a.channel AND active = TRUE
    ORDER BY updated_at DESC
    LIMIT 1;

    IF FOUND THEN
      msg := fn_render_template(
        t.body_template,
        jsonb_build_object(
          'kpi_name', a.kpi_name,
          'severity', a.severity,
          'message', a.message,
          'snapshot_date', a.snapshot_date,
          'tenant_id', a.tenant_id,
          'deviation', a.payload->>'deviation_pct',
          'related_kpi', a.payload->>'related_kpi'
        )
      );
    ELSE
      msg := a.message;
    END IF;

    INSERT INTO public.notification_delivery_logs(alert_id, rule_id, channel, target, message, status, created_at)
    VALUES (a.alert_id, a.rule_id, a.channel, a.target_endpoint, msg, 'sent', now());

    UPDATE public.alert_queue
    SET status = 'sent', sent_at = now(), attempts = attempts + 1
    WHERE alert_id = a.alert_id;
  END LOOP;
END;
$$;


ALTER FUNCTION public.fn_dispatch_notifications(p_limit integer) OWNER TO postgres;

--
-- TOC entry 793 (class 1255 OID 20715)
-- Name: fn_emit_event(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_emit_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_id BIGINT;
  v_payload JSONB;
BEGIN
  IF TG_OP = 'INSERT' THEN
    v_payload := to_jsonb(NEW);
    v_id := COALESCE((NEW).order_id, (NEW).product_id, (NEW).user_id, (NEW).shop_id);
    INSERT INTO public.system_events(source_table, record_id, event_type, payload)
    VALUES (TG_TABLE_NAME, v_id, 'insert', v_payload);
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    v_payload := jsonb_build_object('old', to_jsonb(OLD), 'new', to_jsonb(NEW));
    v_id := COALESCE((NEW).order_id, (NEW).product_id, (NEW).user_id, (NEW).shop_id);
    INSERT INTO public.system_events(source_table, record_id, event_type, payload)
    VALUES (TG_TABLE_NAME, v_id, 'update', v_payload);
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    v_payload := to_jsonb(OLD);
    v_id := COALESCE((OLD).order_id, (OLD).product_id, (OLD).user_id, (OLD).shop_id);
    INSERT INTO public.system_events(source_table, record_id, event_type, payload)
    VALUES (TG_TABLE_NAME, v_id, 'delete', v_payload);
    RETURN OLD;
  END IF;
  RETURN NULL;
END$$;


ALTER FUNCTION public.fn_emit_event() OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 22024)
-- Name: fn_emit_event(text, text, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_emit_event(p_topic text, p_key text, p_payload jsonb) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_tid BIGINT; v_eid BIGINT;
BEGIN
  v_tid := public.fn_register_topic(p_topic);
  INSERT INTO public.rt_event_outbox(topic_id, topic, routing_key, payload, status)
  VALUES (v_tid, p_topic, p_key, p_payload, 'pending')
  RETURNING event_id INTO v_eid;
  PERFORM pg_notify('rt_events',
    json_build_object('event_id', v_eid, 'topic', p_topic, 'key', p_key)::text);
  RETURN v_eid;
END;
$$;


ALTER FUNCTION public.fn_emit_event(p_topic text, p_key text, p_payload jsonb) OWNER TO postgres;

--
-- TOC entry 742 (class 1255 OID 21375)
-- Name: fn_enforce_row_security(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_enforce_row_security(p_table text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_exists BOOLEAN;
BEGIN
  -- Enable RLS
  EXECUTE format('ALTER TABLE public.%I ENABLE ROW LEVEL SECURITY;', p_table);

  -- Check if the tenant isolation policy already exists
  SELECT EXISTS (
    SELECT 1
    FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = p_table
      AND policyname = 'tenant_isolation_policy'
  ) INTO v_exists;

  -- Create only if not found
  IF NOT v_exists THEN
    EXECUTE format(
      'CREATE POLICY tenant_isolation_policy ON public.%I USING (tenant_id = current_setting(''app.tenant_id'')::BIGINT);',
      p_table
    );
    RAISE NOTICE '✅ Tenant isolation policy created for table: %', p_table;
  ELSE
    RAISE NOTICE 'ℹ️ Tenant isolation policy already exists for table: %', p_table;
  END IF;
END;
$$;


ALTER FUNCTION public.fn_enforce_row_security(p_table text) OWNER TO postgres;

--
-- TOC entry 748 (class 1255 OID 21018)
-- Name: fn_enqueue_alert(bigint, bigint, date, character varying, character varying, text, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_enqueue_alert(p_rule_id bigint, p_tenant_id bigint, p_snapshot_date date, p_kpi_name character varying, p_severity character varying, p_message text, p_payload jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.alert_queue(rule_id, tenant_id, snapshot_date, kpi_name, severity, message, payload, status)
  VALUES (p_rule_id, p_tenant_id, p_snapshot_date, p_kpi_name, p_severity, p_message, p_payload, 'pending');
END;
$$;


ALTER FUNCTION public.fn_enqueue_alert(p_rule_id bigint, p_tenant_id bigint, p_snapshot_date date, p_kpi_name character varying, p_severity character varying, p_message text, p_payload jsonb) OWNER TO postgres;

--
-- TOC entry 685 (class 1255 OID 21754)
-- Name: fn_enrich_ai_forecasts_with_market(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_enrich_ai_forecasts_with_market() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE public.ai_price_forecasts pf
  SET expected_demand = expected_demand * (1 + (
      SELECT COALESCE(AVG(t.indicator_change)/100, 0)
      FROM public.ai_market_trends t
      WHERE t.category = 'Demand' AND t.collected_at >= now() - INTERVAL '7 days'))
  WHERE pf.forecast_date >= CURRENT_DATE;

  UPDATE public.ai_inventory_forecasts i
  SET predicted_stock = predicted_stock * (1 - (
      SELECT COALESCE(AVG(t.indicator_change)/100, 0)
      FROM public.ai_market_trends t
      WHERE t.category = 'Supply Risk' AND t.collected_at >= now() - INTERVAL '7 days'))
  WHERE i.forecast_date >= CURRENT_DATE;

  RAISE NOTICE '✅ Forecasts enriched with latest market trends.';
END;
$$;


ALTER FUNCTION public.fn_enrich_ai_forecasts_with_market() OWNER TO postgres;

--
-- TOC entry 755 (class 1255 OID 22536)
-- Name: fn_escalate_budget_alerts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_escalate_budget_alerts() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_rec RECORD;
  v_count INT := 0;
  v_hook_id BIGINT;
  v_payload JSONB;
BEGIN
  FOR v_rec IN
    SELECT a.alert_id, a.tenant_id, a.alert_type, a.message, a.severity, a.alert_time
    FROM public.ai_budget_alerts a
    LEFT JOIN public.ai_alert_escalations e ON e.alert_id = a.alert_id
    WHERE a.resolved = FALSE
      AND a.severity IN ('warning','critical')
      AND e.alert_id IS NULL
  LOOP
    -- queue escalation row (default: webhook)
    INSERT INTO public.ai_alert_escalations(alert_id, tenant_id, channel, target)
    VALUES (v_rec.alert_id, v_rec.tenant_id, 'webhook', 'default')
    RETURNING escalation_id INTO v_hook_id;

    -- try to emit webhook event via outbox if function exists
    v_payload := jsonb_build_object(
      'alert_id', v_rec.alert_id,
      'tenant_id', v_rec.tenant_id,
      'type', v_rec.alert_type,
      'severity', v_rec.severity,
      'message', v_rec.message,
      'alert_time', v_rec.alert_time
    );

    BEGIN
      PERFORM public.fn_emit_event('alert.escalated', 'ai_budget_alerts', v_payload);
    EXCEPTION WHEN undefined_function THEN
      -- Outbox not present; skip silently
      NULL;
    END;

    v_count := v_count + 1;
  END LOOP;

  RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_escalate_budget_alerts() OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 21618)
-- Name: fn_evaluate_decision_context(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_evaluate_decision_context(p_tenant_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_ctx JSONB;
BEGIN
  v_ctx := jsonb_build_object(
    'avg_reward', COALESCE((SELECT AVG(avg_reward) FROM public.ai_model_performance WHERE tenant_id = p_tenant_id),0),
    'avg_accuracy', COALESCE((SELECT AVG(avg_accuracy) FROM public.ai_model_performance WHERE tenant_id = p_tenant_id),0),
    'pricing_pressure', COALESCE((SELECT AVG(expected_revenue) FROM public.ai_price_forecasts),0),
    'inventory_risk', COALESCE((SELECT AVG(days_to_stockout) FROM public.ai_inventory_forecasts),0)
  );
  RETURN v_ctx;
END;
$$;


ALTER FUNCTION public.fn_evaluate_decision_context(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 21854)
-- Name: fn_evaluate_strategy_fitness(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_evaluate_strategy_fitness(p_strategy_id bigint) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_reward NUMERIC;
  v_conf NUMERIC;
  v_vol NUMERIC;
  v_score NUMERIC;
BEGIN
  SELECT COALESCE(AVG(metric_value), 0) INTO v_reward
  FROM public.ai_strategy_metrics WHERE strategy_id = p_strategy_id AND metric_name = 'reward';

  SELECT COALESCE(AVG(metric_value), 0) INTO v_conf
  FROM public.ai_strategy_metrics WHERE strategy_id = p_strategy_id AND metric_name = 'confidence';

  SELECT COALESCE(AVG(metric_value), 0) INTO v_vol
  FROM public.ai_strategy_metrics WHERE strategy_id = p_strategy_id AND metric_name = 'volatility';

  v_score := ROUND((v_reward * 0.6 + v_conf * 0.3 - v_vol * 0.1), 4);

  UPDATE public.ai_strategy_versions
  SET performance_score = v_score,
      reward_avg = v_reward,
      confidence_avg = v_conf,
      volatility = v_vol
  WHERE strategy_id = p_strategy_id;

  RETURN v_score;
END;
$$;


ALTER FUNCTION public.fn_evaluate_strategy_fitness(p_strategy_id bigint) OWNER TO postgres;

--
-- TOC entry 770 (class 1255 OID 21620)
-- Name: fn_execute_decision_cycle(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_execute_decision_cycle(p_tenant_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_action RECORD;
  v_best RECORD;
BEGIN
  -- Select best action by expected reward * confidence
  SELECT *, (expected_reward * confidence) AS score
  INTO v_best
  FROM public.fn_generate_decision_actions(p_tenant_id)
  ORDER BY score DESC
  LIMIT 1;

  IF v_best.policy_id IS NULL THEN
    RAISE NOTICE '⚠️ No decision actions generated for tenant %', p_tenant_id;
    RETURN;
  END IF;

  INSERT INTO public.ai_decision_events(tenant_id, policy_id, action_type, decision_reason, confidence, expected_reward, created_at)
  VALUES (p_tenant_id, v_best.policy_id, v_best.action_type, v_best.reason, v_best.confidence, v_best.expected_reward, now())
  RETURNING * INTO v_action;

  UPDATE public.ai_decision_events
  SET executed = TRUE, executed_at = now(), actual_reward = v_best.expected_reward * (random() * 0.3 + 0.85)
  WHERE decision_id = v_action.decision_id;

  -- Feedback loop: record result to RL system
  PERFORM public.fn_record_rl_feedback(p_tenant_id, v_best.action_type, v_action.decision_id, CURRENT_DATE, v_best.expected_reward, v_action.actual_reward);

  RAISE NOTICE '✅ Decision executed for tenant % -> action: %, reward: %', p_tenant_id, v_best.action_type, v_action.actual_reward;
END;
$$;


ALTER FUNCTION public.fn_execute_decision_cycle(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 730 (class 1255 OID 20911)
-- Name: fn_flag_kpi_anomalies(integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_flag_kpi_anomalies(p_window_days integer DEFAULT 30, p_z numeric DEFAULT 3.0) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Clear flags for the most recent day to avoid duplicates
  DELETE FROM public.kpi_anomaly_flags
  WHERE snapshot_date = (SELECT MAX(snapshot_date) FROM public.kpi_daily_snapshot);

  -- Compute z-scores vs. last N days per tenant and KPI
  INSERT INTO public.kpi_anomaly_flags (snapshot_date, tenant_id, kpi_name, kpi_value, mean_30d, stddev_30d, z_score, severity)
  SELECT
    k.snapshot_date,
    k.tenant_id,
    m.kpi_name,
    m.kpi_value,
    stats.mean_30d,
    stats.stddev_30d,
    CASE
      WHEN stats.stddev_30d IS NULL OR stats.stddev_30d = 0 THEN NULL
      ELSE (m.kpi_value - stats.mean_30d) / stats.stddev_30d
    END AS z_score,
    CASE
      WHEN stats.stddev_30d IS NULL OR stats.stddev_30d = 0 THEN 'info'
      WHEN ABS((m.kpi_value - stats.mean_30d) / stats.stddev_30d) >= p_z THEN 'critical'
      WHEN ABS((m.kpi_value - stats.mean_30d) / stats.stddev_30d) >= (p_z * 0.66) THEN 'warn'
      ELSE 'info'
    END AS severity
  FROM public.kpi_daily_snapshot k
  CROSS JOIN LATERAL (VALUES
    ('total_orders',   k.total_orders::numeric),
    ('total_revenue',  k.total_revenue),
    ('net_revenue',    k.net_revenue),
    ('aov',            k.aov),
    ('repeat_rate',    k.repeat_rate)
  ) AS m(kpi_name, kpi_value)
  LEFT JOIN LATERAL (
    SELECT
      AVG(mv) AS mean_30d,
      STDDEV_POP(mv) AS stddev_30d
    FROM (
      SELECT x.snapshot_date, 
             CASE m.kpi_name
               WHEN 'total_orders'  THEN x.total_orders::numeric
               WHEN 'total_revenue' THEN x.total_revenue
               WHEN 'net_revenue'   THEN x.net_revenue
               WHEN 'aov'           THEN x.aov
               WHEN 'repeat_rate'   THEN x.repeat_rate
             END AS mv
      FROM public.kpi_daily_snapshot x
      WHERE x.tenant_id = k.tenant_id
        AND x.snapshot_date < k.snapshot_date
        AND x.snapshot_date >= k.snapshot_date - make_interval(days => p_window_days)
    ) t
  ) stats ON true
  WHERE k.snapshot_date = (SELECT MAX(snapshot_date) FROM public.kpi_daily_snapshot);
END;
$$;


ALTER FUNCTION public.fn_flag_kpi_anomalies(p_window_days integer, p_z numeric) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 22474)
-- Name: fn_forecast_costs(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_forecast_costs(p_days integer DEFAULT 7) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_tenant RECORD;
  v_daily_orders INT;
  v_revenue NUMERIC;
  v_infra NUMERIC;
  v_ai NUMERIC;
BEGIN
  FOR v_tenant IN SELECT DISTINCT tenant_id FROM public.orders LOOP
    SELECT COUNT(*), COALESCE(SUM(total_amount),0)
    INTO v_daily_orders, v_revenue
    FROM public.orders
    WHERE tenant_id = v_tenant.tenant_id
      AND created_at > now() - interval '1 day';

    v_infra := GREATEST(1, v_daily_orders * 0.05);
    v_ai := GREATEST(0.50, v_revenue * 0.01);

    INSERT INTO public.ai_cost_forecasts (tenant_id, forecast_date, infra_cost, ai_cost, revenue, confidence)
    VALUES (v_tenant.tenant_id, now()::date + (p_days || ' days')::interval, v_infra, v_ai, v_revenue, 0.92);
  END LOOP;

  RAISE NOTICE '✅ Cost forecast generated for % tenants over % days.', (SELECT COUNT(DISTINCT tenant_id) FROM public.orders), p_days;
END;
$$;


ALTER FUNCTION public.fn_forecast_costs(p_days integer) OWNER TO postgres;

--
-- TOC entry 784 (class 1255 OID 21619)
-- Name: fn_generate_decision_actions(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_generate_decision_actions(p_tenant_id bigint) RETURNS TABLE(policy_id bigint, action_type text, reference_id bigint, confidence numeric, expected_reward numeric, reason text)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT p.policy_id,
         CASE p.policy_type
           WHEN 'pricing' THEN 'price_adjustment'
           WHEN 'inventory' THEN 'restock'
           WHEN 'marketing' THEN 'marketing_push'
           WHEN 'compliance' THEN 'alert'
           ELSE 'generic_action'
         END AS action_type,
         NULL::BIGINT AS reference_id,
         (random() * 0.3 + 0.7)::NUMERIC(5,2) AS confidence,
         (random() * 0.2 + 0.8)::NUMERIC(10,4) AS expected_reward,
         CONCAT('Auto-generated action for policy: ', p.policy_name)
  FROM public.ai_decision_policies p
  WHERE p.active = TRUE AND p.tenant_id = p_tenant_id
  ORDER BY p.priority_level DESC;
END;
$$;


ALTER FUNCTION public.fn_generate_decision_actions(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 20975)
-- Name: fn_generate_kpi_explanations(integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_generate_kpi_explanations(p_window_days integer DEFAULT 30, p_corr_threshold numeric DEFAULT 0.6) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.kpi_explainability_logs(
    snapshot_date, tenant_id, kpi_name, observed_value, expected_value,
    deviation_pct, z_score, severity, reason_summary, related_kpi, correlation, created_at
  )
  SELECT
    a.snapshot_date,
    a.tenant_id,
    a.kpi_name,
    a.kpi_value AS observed_value,
    f.forecast_value AS expected_value,
    CASE WHEN f.forecast_value <> 0 THEN ROUND(((a.kpi_value - f.forecast_value)/f.forecast_value)*100,2) END AS deviation_pct,
    COALESCE(z_score,0) AS z_score,
    a.severity,
    CASE
      WHEN a.severity = 'critical' THEN
        'Critical anomaly detected: deviation '||ROUND(((a.kpi_value - f.forecast_value)/NULLIF(f.forecast_value,0))*100,2)||'% from forecast.'
      WHEN a.severity = 'warn' THEN
        'Warning anomaly detected: moderate deviation from expected range.'
      ELSE
        'Minor anomaly or within expected range.'
    END AS reason_summary,
    c.kpi_y AS related_kpi,
    c.correlation,
    now()
  FROM public.kpi_anomaly_flags a
  LEFT JOIN public.kpi_forecast f
    ON f.forecast_date = a.snapshot_date
   AND f.kpi_name = a.kpi_name
   AND f.tenant_id = a.tenant_id
  LEFT JOIN public.kpi_correlations c
    ON c.tenant_id = a.tenant_id
   AND c.kpi_x = a.kpi_name
   AND ABS(c.correlation) >= p_corr_threshold
  WHERE a.snapshot_date >= (now()::date - make_interval(days => p_window_days))
  ON CONFLICT DO NOTHING;
END;
$$;


ALTER FUNCTION public.fn_generate_kpi_explanations(p_window_days integer, p_corr_threshold numeric) OWNER TO postgres;

--
-- TOC entry 728 (class 1255 OID 21855)
-- Name: fn_generate_new_strategy(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_generate_new_strategy(p_tenant_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_parent RECORD;
  v_child_id BIGINT;
  v_mutation NUMERIC := ROUND((random() * 0.15 + 0.05)::NUMERIC, 3); -- 5–20% mutation
  v_new_params JSONB;
  v_new_name TEXT;
BEGIN
  SELECT * INTO v_parent FROM public.ai_strategy_versions
  WHERE tenant_id = p_tenant_id AND is_active = TRUE
  ORDER BY performance_score DESC LIMIT 1;

  IF v_parent IS NULL THEN
    RAISE NOTICE '⚠️ No active strategy found for tenant %', p_tenant_id;
    RETURN NULL;
  END IF;

  v_new_name := v_parent.strategy_name || '_gen' || (v_parent.generation_no + 1);
  v_new_params := jsonb_set(v_parent.parameters, '{mutation_factor}', to_jsonb(v_mutation));

  INSERT INTO public.ai_strategy_versions (tenant_id, base_strategy_id, generation_no, strategy_name, parameters, is_active)
  VALUES (p_tenant_id, v_parent.strategy_id, v_parent.generation_no + 1, v_new_name, v_new_params, FALSE)
  RETURNING strategy_id INTO v_child_id;

  INSERT INTO public.ai_strategy_evolution_history (tenant_id, parent_strategy_id, child_strategy_id, mutation_factor, improvement_pct, notes)
  VALUES (p_tenant_id, v_parent.strategy_id, v_child_id, v_mutation, 0, 'Initial mutation generated.');

  RAISE NOTICE '✅ New strategy % generated for tenant %', v_new_name, p_tenant_id;

  RETURN v_child_id;
END;
$$;


ALTER FUNCTION public.fn_generate_new_strategy(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 21123)
-- Name: fn_generate_recommendations(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_generate_recommendations(p_conf_threshold numeric DEFAULT 0.5) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_recommendations (tenant_id, base_product_id, recommended_product_id, reason, confidence, created_at)
  SELECT
    o.tenant_id,
    oi1.product_id AS base_product_id,
    oi2.product_id AS recommended_product_id,
    'Frequently bought together' AS reason,
    ROUND(COUNT(*)::numeric / (SELECT COUNT(*) FROM public.order_items oi3 WHERE oi3.product_id = oi1.product_id)::numeric, 3) AS confidence,
    now()
  FROM public.orders o
  JOIN public.order_items oi1 ON o.order_id = oi1.order_id
  JOIN public.order_items oi2 ON o.order_id = oi2.order_id AND oi1.product_id <> oi2.product_id
  WHERE o.created_at >= now() - INTERVAL '30 days'
  GROUP BY o.tenant_id, oi1.product_id, oi2.product_id
  HAVING COUNT(*) > 1
  ON CONFLICT DO NOTHING;
END;
$$;


ALTER FUNCTION public.fn_generate_recommendations(p_conf_threshold numeric) OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 21259)
-- Name: fn_generate_retention_actions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_generate_retention_actions() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_retention_actions (user_id, tenant_id, action_type, description, priority, created_at)
  SELECT
    c.user_id,
    c.tenant_id,
    CASE c.churn_risk
      WHEN 'high' THEN 'Win-back Campaign'
      WHEN 'medium' THEN 'Re-engagement Offer'
      ELSE 'Loyalty Reward'
    END AS action_type,
    CASE c.churn_risk
      WHEN 'high' THEN 'Send personalized discount to re-engage lost user.'
      WHEN 'medium' THEN 'Recommend popular items recently trending.'
      ELSE 'Thank user for loyalty with exclusive offer.'
    END AS description,
    CASE c.churn_risk
      WHEN 'high' THEN 'critical'
      WHEN 'medium' THEN 'high'
      ELSE 'normal'
    END AS priority,
    now()
  FROM public.ai_churn_predictions c
  WHERE c.churn_probability >= 0.3
  ON CONFLICT DO NOTHING;
END;
$$;


ALTER FUNCTION public.fn_generate_retention_actions() OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 22702)
-- Name: fn_global_control_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_global_control_cycle() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  rpol RECORD;
  rpred RECORD;
  rcost RECORD;
  t RECORD;
  v_dec TEXT;
  v_reason TEXT;
  v_conf NUMERIC := 0.9;
BEGIN
  FOR rpol IN
    SELECT * FROM public.sys_control_policies WHERE is_active = TRUE
  LOOP
    SELECT
      COALESCE(SUM(requests),0) AS reqs,
      COALESCE(SUM(errors),0)   AS errs,
      COALESCE(AVG(p95_latency_ms),0) AS p95
    INTO t
    FROM public.sys_telemetry_ingest
    WHERE tenant_id = rpol.tenant_id
      AND component = rpol.component
      AND ts > now() - interval '5 min';

    SELECT predicted_cpu_load AS cpu, predicted_memory_gb AS mem
    INTO rpred
    FROM public.ai_scaling_predictions
    ORDER BY created_at DESC
    LIMIT 1;

    SELECT (infra_cost + ai_cost) AS cost, revenue, margin
    INTO rcost
    FROM public.ai_cost_forecasts
    WHERE tenant_id = rpol.tenant_id
    ORDER BY created_at DESC
    LIMIT 1;

    IF t.p95 > rpol.target_latency_ms OR (t.errs > (t.reqs * 0.02)) THEN
      v_dec   := 'throttle';
      v_reason:= format(
        'p95=%sms > target=%sms OR errRate=%s%%',
        ROUND(t.p95,2)::text,
        ROUND(rpol.target_latency_ms,2)::text,
        CASE WHEN t.reqs=0 THEN '0' ELSE ROUND((t.errs*100.0/t.reqs),2)::text END
      );
      v_conf  := 0.92;
    ELSIF rpred.cpu IS NOT NULL AND (rpred.cpu > 80 OR rpred.mem > 50) THEN
      v_dec   := 'scale_up';
      v_reason:= format(
        'predicted CPU %s%% / MEM %sGB high',
        ROUND(rpred.cpu,2)::text,
        ROUND(rpred.mem,2)::text
      );
      v_conf  := 0.91;
    ELSIF rpred.cpu IS NOT NULL AND (rpred.cpu < 20 AND rpred.mem < 10) THEN
      v_dec   := 'scale_down';
      v_reason:= format(
        'predicted CPU %s%% / MEM %sGB low',
        ROUND(rpred.cpu,2)::text,
        ROUND(rpred.mem,2)::text
      );
      v_conf  := 0.90;
    ELSE
      v_dec   := COALESCE(NULLIF(rpol.scale_floor,'maintain'),'maintain');
      v_reason:= 'within policy targets';
      v_conf  := 0.88;
    END IF;

    IF rpol.cost_guard > 0 AND rcost.cost IS NOT NULL AND rcost.cost > rpol.cost_guard THEN
      v_dec   := 'hold_spend';
      v_reason:= format(
        'cost %s exceeded guard %s',
        ROUND(rcost.cost,2)::text,
        ROUND(rpol.cost_guard,2)::text
      );
      v_conf  := 0.93;
    END IF;

    INSERT INTO public.ai_global_decisions(tenant_id, component, decision, reason, details, confidence)
    VALUES (
      rpol.tenant_id, rpol.component, v_dec, v_reason,
      jsonb_build_object(
        'requests', COALESCE(t.reqs,0),
        'errors',   COALESCE(t.errs,0),
        'p95_ms',   COALESCE(t.p95,0),
        'cpu',      COALESCE(rpred.cpu,0),
        'mem',      COALESCE(rpred.mem,0),
        'cost',     COALESCE(rcost.cost,0),
        'revenue',  COALESCE(rcost.revenue,0)
      ),
      v_conf
    );

    INSERT INTO public.ai_resource_actions(action_type, target_component, decision_reason, expected_impact, confidence)
    VALUES (
      CASE v_dec
        WHEN 'scale_up'   THEN 'scale_up'
        WHEN 'scale_down' THEN 'scale_down'
        WHEN 'throttle'   THEN 'throttle'
        WHEN 'hold_spend' THEN 'optimize_price'
        ELSE 'maintain'
      END,
      rpol.component,
      v_reason,
      'Applied by global control cycle',
      v_conf
    );
  END LOOP;

  RAISE NOTICE '✅ Global control cycle executed.';
END;
$$;


ALTER FUNCTION public.fn_global_control_cycle() OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 21752)
-- Name: fn_ingest_market_signal(text, text, text, numeric, numeric, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_ingest_market_signal(p_source text, p_category text, p_indicator text, p_value numeric, p_change numeric, p_region text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_source_id BIGINT;
BEGIN
  SELECT source_id INTO v_source_id FROM public.ai_market_sources WHERE source_name = p_source LIMIT 1;
  IF v_source_id IS NULL THEN
    INSERT INTO public.ai_market_sources(source_name, source_type) VALUES (p_source, 'manual')
    RETURNING source_id INTO v_source_id;
  END IF;

  INSERT INTO public.ai_market_trends(source_id, category, indicator_name, indicator_value, indicator_change, region, collected_at)
  VALUES (v_source_id, p_category, p_indicator, p_value, p_change, p_region, now());
END;
$$;


ALTER FUNCTION public.fn_ingest_market_signal(p_source text, p_category text, p_indicator text, p_value numeric, p_change numeric, p_region text) OWNER TO postgres;

--
-- TOC entry 760 (class 1255 OID 22701)
-- Name: fn_ingest_telemetry(text, bigint, bigint, numeric, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_ingest_telemetry(p_component text, p_requests bigint, p_errors bigint, p_p95_ms numeric, p_tenant bigint DEFAULT 1) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.sys_telemetry_ingest(ts, tenant_id, component, requests, errors, p95_latency_ms)
  VALUES (now(), p_tenant, p_component, GREATEST(p_requests,0), GREATEST(p_errors,0), GREATEST(p_p95_ms,0));
END;
$$;


ALTER FUNCTION public.fn_ingest_telemetry(p_component text, p_requests bigint, p_errors bigint, p_p95_ms numeric, p_tenant bigint) OWNER TO postgres;

--
-- TOC entry 746 (class 1255 OID 21325)
-- Name: fn_init_default_churn_weights(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_init_default_churn_weights() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_churn_feature_weights(model_name, w_recency, w_frequency, w_monetary, updated_at)
  VALUES ('rfm_churn_v1', 0.40, 0.30, 0.30, now())
  ON CONFLICT (model_name) DO NOTHING;
END;
$$;


ALTER FUNCTION public.fn_init_default_churn_weights() OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 22273)
-- Name: fn_launch_campaign(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_launch_campaign(p_campaign_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public.ai_campaigns
       SET status='launched',
           launched_at=now()
     WHERE campaign_id=p_campaign_id;

    UPDATE public.ai_campaign_targets
       SET status='sent', sent_at=now()
     WHERE campaign_id=p_campaign_id AND status='pending';

    UPDATE public.ai_campaign_metrics
       SET total_sent=(SELECT COUNT(*) FROM public.ai_campaign_targets WHERE campaign_id=p_campaign_id),
           last_updated=now()
     WHERE campaign_id=p_campaign_id;

    INSERT INTO public.sys_health_events(event_type, severity, details)
    VALUES ('campaign_launch','info',format('Campaign %s launched', p_campaign_id));
END;
$$;


ALTER FUNCTION public.fn_launch_campaign(p_campaign_id bigint) OWNER TO postgres;

--
-- TOC entry 767 (class 1255 OID 21373)
-- Name: fn_log_audit_event(bigint, bigint, text, text, inet, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_audit_event(p_tenant_id bigint, p_user_id bigint, p_table_name text, p_access_type text, p_ip_address inet DEFAULT NULL::inet, p_metadata jsonb DEFAULT '{}'::jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.audit_access_logs(tenant_id, user_id, table_name, access_type, ip_address, metadata)
  VALUES (p_tenant_id, p_user_id, p_table_name, p_access_type, p_ip_address, p_metadata);
END;
$$;


ALTER FUNCTION public.fn_log_audit_event(p_tenant_id bigint, p_user_id bigint, p_table_name text, p_access_type text, p_ip_address inet, p_metadata jsonb) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 21326)
-- Name: fn_log_campaign_outcome(bigint, boolean, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_campaign_outcome(p_action_id bigint, p_converted boolean, p_revenue_after numeric DEFAULT 0) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_user BIGINT; v_tenant BIGINT;
BEGIN
  SELECT user_id, tenant_id INTO v_user, v_tenant
  FROM public.ai_retention_actions WHERE action_id = p_action_id;

  INSERT INTO public.ai_campaign_outcomes(action_id, user_id, tenant_id, converted, revenue_after, observed_at)
  VALUES (p_action_id, v_user, v_tenant, COALESCE(p_converted,false), COALESCE(p_revenue_after,0), now());

  IF p_converted THEN
    UPDATE public.ai_retention_actions
    SET status = 'completed', completed_at = now()
    WHERE action_id = p_action_id;
  END IF;
END;
$$;


ALTER FUNCTION public.fn_log_campaign_outcome(p_action_id bigint, p_converted boolean, p_revenue_after numeric) OWNER TO postgres;

--
-- TOC entry 772 (class 1255 OID 21957)
-- Name: fn_log_model_explanation(bigint, text, bigint, bigint, numeric, jsonb, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_model_explanation(p_tenant_id bigint, p_model_type text, p_decision_id bigint, p_reference_id bigint, p_confidence numeric, p_explanation jsonb, p_feature_importance jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_explainability_logs
    (tenant_id, model_type, decision_id, reference_id, confidence, explanation, feature_importance)
  VALUES
    (p_tenant_id, p_model_type, p_decision_id, p_reference_id, p_confidence, p_explanation, p_feature_importance);
END;
$$;


ALTER FUNCTION public.fn_log_model_explanation(p_tenant_id bigint, p_model_type text, p_decision_id bigint, p_reference_id bigint, p_confidence numeric, p_explanation jsonb, p_feature_importance jsonb) OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 22713)
-- Name: fn_log_user_action(bigint, text, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_user_action(p_telegram_id bigint, p_action text, p_metadata jsonb DEFAULT '{}'::jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_user_id BIGINT;
BEGIN
    SELECT user_id INTO v_user_id
    FROM public.users
    WHERE telegram_id = p_telegram_id;

    IF v_user_id IS NULL THEN
        RAISE NOTICE '⚠️ No user found for telegram_id %', p_telegram_id;
        RETURN;
    END IF;

    INSERT INTO public.user_activity_logs (user_id, action, metadata, created_at)
    VALUES (v_user_id, p_action, p_metadata, now());
END;
$$;


ALTER FUNCTION public.fn_log_user_action(p_telegram_id bigint, p_action text, p_metadata jsonb) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 21431)
-- Name: fn_monitor_governance_health(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_monitor_governance_health() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_tenant RECORD;
  v_failed_jobs INT;
  v_old_exports INT;
BEGIN
  FOR v_tenant IN SELECT tenant_id FROM public.tenant_policies LOOP
    -- Check job failures from data_retention_jobs or job_run_history
    SELECT COUNT(*) INTO v_failed_jobs
    FROM public.job_run_history
    WHERE status = 'failed' AND started_at >= now() - INTERVAL '1 day';

    IF v_failed_jobs > 0 THEN
      INSERT INTO public.ai_compliance_alerts(tenant_id, alert_type, severity, description, metadata)
      VALUES (v_tenant.tenant_id, 'FAILED_JOB', 'high',
              format('Detected %s failed job(s) for tenant %s', v_failed_jobs, v_tenant.tenant_id),
              jsonb_build_object('failed_jobs', v_failed_jobs));
    END IF;

    -- Check for PII exports in audit log
    SELECT COUNT(*) INTO v_old_exports
    FROM public.audit_access_logs
    WHERE access_type = 'EXPORT'
      AND access_time >= now() - INTERVAL '1 day';

    IF v_old_exports > 0 THEN
      INSERT INTO public.ai_compliance_alerts(tenant_id, alert_type, severity, description, metadata)
      VALUES (v_tenant.tenant_id, 'PII_EXPORT', 'medium',
              'Detected export activity within last 24 hours.',
              jsonb_build_object('exports', v_old_exports));
    END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION public.fn_monitor_governance_health() OWNER TO postgres;

--
-- TOC entry 765 (class 1255 OID 22737)
-- Name: fn_notify_bot(bigint, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_notify_bot(p_shop_id bigint, p_event jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_bot RECORD;
BEGIN
    SELECT * INTO v_bot FROM public.shop_bots WHERE shop_id = p_shop_id AND status = 'active';
    IF FOUND THEN
        INSERT INTO public.rt_event_outbox(topic, routing_key, payload, status)
        VALUES ('bot.notification', v_bot.bot_token, p_event, 'pending');
    END IF;
END;
$$;


ALTER FUNCTION public.fn_notify_bot(p_shop_id bigint, p_event jsonb) OWNER TO postgres;

--
-- TOC entry 759 (class 1255 OID 22505)
-- Name: fn_optimize_budget(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_optimize_budget() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v RECORD;
  v_new_budget NUMERIC;
BEGIN
  FOR v IN 
    SELECT tenant_id,
           AVG(infra_cost + ai_cost) AS avg_cost,
           AVG(revenue) AS avg_rev,
           AVG(margin) AS avg_margin
    FROM public.ai_cost_forecasts
    GROUP BY tenant_id
  LOOP
    v_new_budget := GREATEST(1, v.avg_cost * 0.9); -- suggest 10% cost reduction baseline

    INSERT INTO public.ai_budget_optimizer(tenant_id, recommended_budget, expected_revenue, target_margin, confidence)
    VALUES (v.tenant_id, v_new_budget, v.avg_rev, ROUND((v.avg_margin / NULLIF(v.avg_rev,0)) * 100, 2), 0.93);
  END LOOP;

  RAISE NOTICE '💰 Budget optimization cycle completed.';
END;
$$;


ALTER FUNCTION public.fn_optimize_budget() OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 22443)
-- Name: fn_optimize_pricing(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_optimize_pricing() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_avg NUMERIC;
  v_adj NUMERIC;
BEGIN
  SELECT AVG(price) INTO v_avg FROM public.products;
  IF v_avg IS NULL THEN RETURN; END IF;

  v_adj := CASE
             WHEN (SELECT COUNT(*) FROM public.orders WHERE created_at > now() - interval '30 min') > 50 THEN 1.05
             WHEN (SELECT COUNT(*) FROM public.orders WHERE created_at > now() - interval '30 min') < 10 THEN 0.95
             ELSE 1.00
           END;

  UPDATE public.products
  SET price = ROUND(price * v_adj, 2);

  INSERT INTO public.ai_resource_actions(action_type, target_component, decision_reason, expected_impact, confidence)
  VALUES ('optimize_price', 'pricing_engine', 'Demand-based adjustment', 'Dynamic pricing applied', 0.90);

  RAISE NOTICE '💰 Pricing optimization executed with multiplier %.2f', v_adj;
END;
$$;


ALTER FUNCTION public.fn_optimize_pricing() OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 22419)
-- Name: fn_predict_workload(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_predict_workload(p_minutes_ahead integer DEFAULT 60) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_orders INT;
  v_revenue NUMERIC;
  v_cpu NUMERIC;
  v_memory NUMERIC;
BEGIN
  SELECT COUNT(*), COALESCE(SUM(total_amount),0)
  INTO v_orders, v_revenue
  FROM public.orders
  WHERE created_at > now() - interval '1 hour';

  v_cpu := LEAST(90, GREATEST(10, (v_orders / 10.0)));
  v_memory := LEAST(64, GREATEST(2, (v_revenue / 500.0)));

  INSERT INTO public.ai_scaling_predictions(
    forecast_time, period_minutes,
    predicted_orders, predicted_revenue,
    predicted_cpu_load, predicted_memory_gb,
    confidence
  )
  VALUES (
    now() + make_interval(mins => p_minutes_ahead),
    p_minutes_ahead, v_orders, v_revenue, v_cpu, v_memory, 0.92
  );

  RAISE NOTICE
    '✅ fn_predict_workload: Forecasted % orders, CPU=% units, MEM=% GB for +% min.',
    v_orders, v_cpu, v_memory, p_minutes_ahead;
END;
$$;


ALTER FUNCTION public.fn_predict_workload(p_minutes_ahead integer) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 22537)
-- Name: fn_process_alert_escalations(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_process_alert_escalations(p_limit integer DEFAULT 50) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_rec RECORD;
  v_done INT := 0;
BEGIN
  FOR v_rec IN
    SELECT e.escalation_id, e.alert_id, e.tenant_id
    FROM public.ai_alert_escalations e
    WHERE e.status IN ('queued','failed')
    ORDER BY e.created_at
    LIMIT p_limit
  LOOP
    -- if generic webhook queue exists, emit event again to ensure pickup
    BEGIN
      PERFORM public.fn_emit_event('alert.delivery', 'ai_alert_escalations',
        jsonb_build_object('escalation_id', v_rec.escalation_id, 'alert_id', v_rec.alert_id, 'tenant_id', v_rec.tenant_id));
      UPDATE public.ai_alert_escalations
         SET status='success', attempts=attempts+1, last_attempt=now(), response_code=200, response_body='queued-to-outbox'
       WHERE escalation_id = v_rec.escalation_id;
    EXCEPTION WHEN undefined_function THEN
      -- fallback: mark as success without external delivery
      UPDATE public.ai_alert_escalations
         SET status='success', attempts=attempts+1, last_attempt=now(), response_code=299, response_body='simulated-delivery'
       WHERE escalation_id = v_rec.escalation_id;
    END;
    v_done := v_done + 1;
  END LOOP;

  RETURN v_done;
END;
$$;


ALTER FUNCTION public.fn_process_alert_escalations(p_limit integer) OWNER TO postgres;

--
-- TOC entry 749 (class 1255 OID 22104)
-- Name: fn_process_webhook_queue(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_process_webhook_queue(p_limit integer DEFAULT 20) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_row RECORD;
    v_count INT := 0;
BEGIN
    FOR v_row IN
        SELECT d.delivery_id, d.webhook_id, w.target_url, d.event_id, e.payload, w.secret_token, d.attempts
        FROM public.rt_webhook_deliveries d
        JOIN public.rt_webhook_endpoints w ON w.webhook_id = d.webhook_id
        JOIN public.rt_event_outbox e ON e.event_id = d.event_id
        WHERE d.status IN ('pending','failed')
          AND (d.next_attempt IS NULL OR d.next_attempt <= now())
        ORDER BY d.created_at
        LIMIT p_limit
    LOOP
        BEGIN
            -- Simulated HTTP call (replace with pg_net/http extension in prod)
            UPDATE public.rt_webhook_deliveries
            SET status = 'success', response_code = 200, response_body = '{"ok":true}', last_attempt = now()
            WHERE delivery_id = v_row.delivery_id;

            v_count := v_count + 1;
        EXCEPTION WHEN OTHERS THEN
            UPDATE public.rt_webhook_deliveries
            SET status = 'failed',
                attempts = attempts + 1,
                error_message = SQLERRM,
                next_attempt = now() + (INTERVAL '1 minute' * POWER(2, LEAST(attempts, 5))),
                last_attempt = now()
            WHERE delivery_id = v_row.delivery_id;
        END;
    END LOOP;
    RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_process_webhook_queue(p_limit integer) OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 22025)
-- Name: fn_publish_outbox(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_publish_outbox(p_limit integer DEFAULT 100) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE v_count INT := 0; v_row RECORD;
BEGIN
  FOR v_row IN
    SELECT event_id, topic, routing_key
    FROM public.rt_event_outbox
    WHERE status = 'pending'
    ORDER BY event_id LIMIT p_limit
  LOOP
    PERFORM pg_notify('rt_events',
      json_build_object('event_id', v_row.event_id,
                        'topic', v_row.topic, 'key', v_row.routing_key)::text);
    UPDATE public.rt_event_outbox
      SET status='published', published_at=now(), attempts=attempts+1
      WHERE event_id=v_row.event_id;
    v_count := v_count + 1;
  END LOOP;
  RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_publish_outbox(p_limit integer) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 22101)
-- Name: fn_queue_webhook_event(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_queue_webhook_event(p_event_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE v_count INT := 0;
BEGIN
    INSERT INTO public.rt_webhook_deliveries (webhook_id, event_id)
    SELECT w.webhook_id, p_event_id
    FROM public.rt_webhook_endpoints w
    WHERE w.is_active = TRUE;
    GET DIAGNOSTICS v_count = ROW_COUNT;
    RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_queue_webhook_event(p_event_id bigint) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 22206)
-- Name: fn_recommend_products_for_user(bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_recommend_products_for_user(p_user_id bigint, p_limit integer DEFAULT 10) RETURNS TABLE(product_id bigint, similarity numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.product_id,
        ROUND(
            (1 - abs((u.vector[2] - p.vector[2])) / (u.vector[2] + 0.01))::NUMERIC,
            3
        ) AS similarity
    FROM public.ai_user_embeddings u
    JOIN public.ai_product_embeddings p ON TRUE
    WHERE u.user_id = p_user_id
    ORDER BY similarity DESC
    LIMIT p_limit;
END;
$$;


ALTER FUNCTION public.fn_recommend_products_for_user(p_user_id bigint, p_limit integer) OWNER TO postgres;

--
-- TOC entry 741 (class 1255 OID 21328)
-- Name: fn_recompute_churn_with_weights(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_recompute_churn_with_weights(p_days_back integer DEFAULT 90, p_model_name text DEFAULT 'rfm_churn_v1'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE wr NUMERIC; wf NUMERIC; wm NUMERIC; total NUMERIC;
BEGIN
  PERFORM public.fn_init_default_churn_weights();
  SELECT w_recency, w_frequency, w_monetary INTO wr, wf, wm
  FROM public.ai_churn_feature_weights WHERE model_name = p_model_name;

  total := NULLIF(wr + wf + wm, 0);
  IF total IS NULL THEN
    wr := 0.4; wf := 0.3; wm := 0.3; total := 1.0;
  END IF;
  wr := wr / total; wf := wf / total; wm := wm / total;

  INSERT INTO public.ai_churn_predictions (user_id, tenant_id, churn_probability, churn_risk, last_activity, recency_days, frequency_30d, monetary_90d, reason, created_at)
  SELECT
    u.user_id,
    u.tenant_id,
    ROUND(
      LEAST(1.0,
        wr * (EXTRACT(DAY FROM (now() - MAX(o.created_at))) / p_days_back)::numeric +
        wf * (1 - (COUNT(DISTINCT o.order_id) / GREATEST(1, COUNT(DISTINCT o.order_id) + 10))) +
        wm * (1 - (COALESCE(SUM(p.amount), 0) / GREATEST(1, SUM(p.amount) + 500)))
      ), 4
    ) AS churn_probability,
    CASE
      WHEN (EXTRACT(DAY FROM (now() - MAX(o.created_at))) > 90 OR COUNT(DISTINCT o.order_id) < 2) THEN 'high'
      WHEN (EXTRACT(DAY FROM (now() - MAX(o.created_at))) BETWEEN 30 AND 90) THEN 'medium'
      ELSE 'low'
    END AS churn_risk,
    MAX(o.created_at) AS last_activity,
    EXTRACT(DAY FROM (now() - MAX(o.created_at)))::int AS recency_days,
    COUNT(*) FILTER (WHERE o.created_at >= now() - INTERVAL '30 days')::numeric AS frequency_30d,
    COALESCE(SUM(p.amount) FILTER (WHERE o.created_at >= now() - INTERVAL '90 days'), 0)::numeric AS monetary_90d,
    'Recomputed with tuned weights wr='||wr||', wf='||wf||', wm='||wm,
    now()
  FROM public.users u
  LEFT JOIN public.orders o ON u.user_id = o.user_id
  LEFT JOIN public.payments p ON o.order_id = p.order_id
  GROUP BY u.user_id, u.tenant_id
  ON CONFLICT (user_id) DO UPDATE SET
    churn_probability = EXCLUDED.churn_probability,
    churn_risk = EXCLUDED.churn_risk,
    last_activity = EXCLUDED.last_activity,
    recency_days = EXCLUDED.recency_days,
    frequency_30d = EXCLUDED.frequency_30d,
    monetary_90d = EXCLUDED.monetary_90d,
    reason = EXCLUDED.reason,
    created_at = now();
END;
$$;


ALTER FUNCTION public.fn_recompute_churn_with_weights(p_days_back integer, p_model_name text) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 22274)
-- Name: fn_record_campaign_event(bigint, bigint, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_record_campaign_event(p_campaign_id bigint, p_user_id bigint, p_event_type character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_conv NUMERIC;
BEGIN
    UPDATE public.ai_campaign_targets
       SET status='interacted', interacted_at=now()
     WHERE campaign_id=p_campaign_id AND user_id=p_user_id;

    UPDATE public.ai_campaign_metrics
       SET total_interacted=(SELECT COUNT(*) FROM public.ai_campaign_targets WHERE campaign_id=p_campaign_id AND status='interacted'),
           conversion_rate=ROUND((total_interacted::NUMERIC / NULLIF(total_sent,0))*100,2),
           roi=ROUND(conversion_rate*0.75,2),
           last_updated=now()
     WHERE campaign_id=p_campaign_id;
END;
$$;


ALTER FUNCTION public.fn_record_campaign_event(p_campaign_id bigint, p_user_id bigint, p_event_type character varying) OWNER TO postgres;

--
-- TOC entry 743 (class 1255 OID 21564)
-- Name: fn_record_rl_feedback(bigint, text, bigint, date, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_record_rl_feedback(p_tenant_id bigint, p_model_type text, p_reference_id bigint, p_forecast_date date, p_predicted numeric, p_actual numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_reward NUMERIC;
BEGIN
  -- Reward function: higher reward for smaller relative error
  IF p_actual > 0 THEN
    v_reward := 1 - abs(p_predicted - p_actual) / p_actual;
  ELSE
    v_reward := 0;
  END IF;

  INSERT INTO public.ai_rl_feedback(tenant_id, model_type, reference_id, forecast_date, predicted_value, actual_value, reward_score)
  VALUES (p_tenant_id, p_model_type, p_reference_id, p_forecast_date, p_predicted, p_actual, v_reward);
END;
$$;


ALTER FUNCTION public.fn_record_rl_feedback(p_tenant_id bigint, p_model_type text, p_reference_id bigint, p_forecast_date date, p_predicted numeric, p_actual numeric) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 20865)
-- Name: fn_refresh_ai_analytics(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_refresh_ai_analytics() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    REFRESH MATERIALIZED VIEW public.product_affinity;
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Skip refresh product_affinity (first build?)';
  END;

  BEGIN
    PERFORM public.fn_update_user_behavior_metrics(90);
  EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Skip fn_update_user_behavior_metrics';
  END;
END;
$$;


ALTER FUNCTION public.fn_refresh_ai_analytics() OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 19998)
-- Name: fn_refresh_all_views(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_refresh_all_views() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN PERFORM public.refresh_shop_sales_summary(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skipping shop_sales_summary'; END;
  BEGIN PERFORM public.refresh_sales_by_day(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skipping sales_by_day'; END;
  BEGIN PERFORM public.refresh_financial_summary(); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Skipping financial_summary'; END;
END;
$$;


ALTER FUNCTION public.fn_refresh_all_views() OWNER TO postgres;

--
-- TOC entry 753 (class 1255 OID 22272)
-- Name: fn_refresh_marketing_segments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_refresh_marketing_segments() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_high_ltv BIGINT;
    v_dormant BIGINT;
BEGIN
    -- Segment A: High Lifetime Value
    INSERT INTO public.ai_marketing_segments (segment_name, criteria)
    VALUES ('High LTV Users', '{"rule": "users with lifetime_value > 500"}')
    ON CONFLICT (segment_name) DO NOTHING;

    -- Segment B: Dormant users (no recent activity)
    INSERT INTO public.ai_marketing_segments (segment_name, criteria)
    VALUES ('Dormant Users', '{"rule": "users not active for > 30 days"}')
    ON CONFLICT (segment_name) DO NOTHING;

    -- Refresh segment targets
    DELETE FROM public.ai_campaign_targets WHERE status='pending';

    -- Assign users to segments dynamically
    INSERT INTO public.ai_campaign_targets (campaign_id, user_id)
    SELECT c.campaign_id, u.user_id
    FROM public.ai_campaigns c
    JOIN public.users u ON
        (c.segment_id IN (
            SELECT segment_id FROM public.ai_marketing_segments WHERE segment_name='High LTV Users'
        ) AND u.user_id IN (
            SELECT user_id FROM public.ai_customer_profiles WHERE lifetime_value > 500
        ))
        OR
        (c.segment_id IN (
            SELECT segment_id FROM public.ai_marketing_segments WHERE segment_name='Dormant Users'
        ) AND u.user_id IN (
            SELECT user_id FROM public.user_activity_logs
            GROUP BY user_id
            HAVING MAX(created_at) < now() - interval '30 days'
        ));
END;
$$;


ALTER FUNCTION public.fn_refresh_marketing_segments() OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 22044)
-- Name: fn_refresh_stream_sales_5m(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_refresh_stream_sales_5m() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY public.mv_stream_sales_5m;
  EXCEPTION WHEN OTHERS THEN
    REFRESH MATERIALIZED VIEW public.mv_stream_sales_5m;
  END;
END;
$$;


ALTER FUNCTION public.fn_refresh_stream_sales_5m() OWNER TO postgres;

--
-- TOC entry 786 (class 1255 OID 21805)
-- Name: fn_register_scenario(text, text, jsonb, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_register_scenario(p_name text, p_type text, p_assumptions jsonb, p_desc text, p_creator text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id BIGINT;
BEGIN
  INSERT INTO public.ai_scenario_library (scenario_name, scenario_type, assumptions, description, created_by)
  VALUES (p_name, p_type, p_assumptions, p_desc, p_creator)
  RETURNING scenario_id INTO v_id;
  RETURN v_id;
END;
$$;


ALTER FUNCTION public.fn_register_scenario(p_name text, p_type text, p_assumptions jsonb, p_desc text, p_creator text) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 22023)
-- Name: fn_register_topic(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_register_topic(p_name text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id BIGINT;
BEGIN
  SELECT topic_id INTO v_id FROM public.rt_event_topics WHERE name = p_name;
  IF v_id IS NULL THEN
    INSERT INTO public.rt_event_topics(name)
    VALUES (p_name) RETURNING topic_id INTO v_id;
  END IF;
  RETURN v_id;
END;
$$;


ALTER FUNCTION public.fn_register_topic(p_name text) OWNER TO postgres;

--
-- TOC entry 757 (class 1255 OID 22100)
-- Name: fn_register_webhook(bigint, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_register_webhook(p_tenant_id bigint, p_name text, p_url text, p_secret text DEFAULT NULL::text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id BIGINT;
BEGIN
    INSERT INTO public.rt_webhook_endpoints(tenant_id, name, target_url, secret_token)
    VALUES (p_tenant_id, p_name, p_url, p_secret)
    RETURNING webhook_id INTO v_id;
    RETURN v_id;
END;
$$;


ALTER FUNCTION public.fn_register_webhook(p_tenant_id bigint, p_name text, p_url text, p_secret text) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 21081)
-- Name: fn_render_template(text, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_render_template(p_template text, p_vars jsonb) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
  v_result TEXT := p_template;
  v_key TEXT;
  v_val TEXT;
BEGIN
  FOR v_key, v_val IN SELECT key, value::text FROM jsonb_each(p_vars)
  LOOP
    v_result := replace(v_result, '{{'||v_key||'}}', COALESCE(v_val,''));
  END LOOP;
  RETURN v_result;
END;
$$;


ALTER FUNCTION public.fn_render_template(p_template text, p_vars jsonb) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 581 (class 1259 OID 21982)
-- Name: rt_event_outbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_event_outbox (
    event_id bigint NOT NULL,
    topic_id bigint,
    topic text NOT NULL,
    routing_key text,
    payload jsonb NOT NULL,
    status text DEFAULT 'pending'::text,
    attempts integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    published_at timestamp with time zone,
    last_error text
);


ALTER TABLE public.rt_event_outbox OWNER TO postgres;

--
-- TOC entry 724 (class 1255 OID 22026)
-- Name: fn_replay_events(bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_replay_events(p_from_event bigint, p_limit integer DEFAULT 1000) RETURNS SETOF public.rt_event_outbox
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT * FROM public.rt_event_outbox
  WHERE event_id > p_from_event
  ORDER BY event_id
  LIMIT p_limit;
END;
$$;


ALTER FUNCTION public.fn_replay_events(p_from_event bigint, p_limit integer) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 22538)
-- Name: fn_revenue_protection_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_revenue_protection_cycle() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_rec RECORD;
  v_actions INT := 0;
BEGIN
  -- Identify tenants with latest negative margin OR critical overspend
  FOR v_rec IN
    SELECT DISTINCT c.tenant_id
    FROM public.ai_cost_forecasts c
    LEFT JOIN public.ai_budget_alerts a ON a.tenant_id = c.tenant_id AND a.severity='critical' AND a.resolved=FALSE
    WHERE c.margin < 0 OR a.alert_id IS NOT NULL
  LOOP
    -- Action A: pause active campaigns for tenant (if campaign table exists)
    BEGIN
      UPDATE public.ai_campaigns
         SET status='paused'
       WHERE (segment_id IS NOT NULL OR segment_id IS NULL) -- noop filter to avoid dependency on segments
         AND status IN ('launched','draft')  -- pause launched; keep drafts paused as well
         AND (tenant_id = v_rec.tenant_id OR NOT EXISTS (
               SELECT 1 FROM information_schema.columns 
               WHERE table_schema='public' AND table_name='ai_campaigns' AND column_name='tenant_id'
             ));
      v_actions := v_actions + 1;
    EXCEPTION WHEN undefined_table THEN
      -- campaigns not installed; skip
      NULL;
    END;

    -- Action B: tighten budget recommendation by 10%
    INSERT INTO public.ai_revenue_protection_actions(tenant_id, action_type, decision_reason, expected_impact, executed, executed_at)
    VALUES (v_rec.tenant_id, 'reduce_budget',
            'Negative margin or critical cost alert',
            'Reduce recommended spend by 10% for next cycle',
            TRUE, now());
    -- If optimizer table exists, write a new recommendation reduced by 10%
    BEGIN
      INSERT INTO public.ai_budget_optimizer(tenant_id, recommended_budget, expected_revenue, target_margin, confidence)
      SELECT o.tenant_id,
             GREATEST(1, o.recommended_budget * 0.90),
             o.expected_revenue,
             o.target_margin,
             LEAST(0.99, o.confidence + 0.02)
      FROM public.ai_budget_optimizer o
      WHERE o.tenant_id = v_rec.tenant_id
      ORDER BY o.created_at DESC NULLS LAST
      LIMIT 1;
    EXCEPTION WHEN undefined_table THEN
      NULL;
    END;

  END LOOP;

  RETURN v_actions;
END;
$$;


ALTER FUNCTION public.fn_revenue_protection_cycle() OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 22045)
-- Name: fn_rt_trim_outbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_rt_trim_outbox() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE v_deleted INT;
BEGIN
  DELETE FROM public.rt_event_outbox
  WHERE created_at < now() - INTERVAL '14 days'
     OR (status='published' AND created_at < now() - INTERVAL '7 days');
  GET DIAGNOSTICS v_deleted = ROW_COUNT;
  RETURN v_deleted;
END;
$$;


ALTER FUNCTION public.fn_rt_trim_outbox() OWNER TO postgres;

--
-- TOC entry 764 (class 1255 OID 21124)
-- Name: fn_run_ai_recommendation_job(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_ai_recommendation_job(p_days_back integer DEFAULT 30) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status, details)
  VALUES ('ai_recommendation_job', now(), 'running', jsonb_build_object('days_back', p_days_back))
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_update_trend_insights(p_days_back);
    PERFORM public.fn_generate_recommendations(0.5);

    INSERT INTO public.ai_marketing_insights(snapshot_date, tenant_id, category_id, insight_type, description, impact_score, created_at)
    SELECT
      now()::date,
      p.tenant_id,
      p.category_id,
      'Rising Product',
      'Product '||p.name||' shows strong upward momentum.',
      0.9,
      now()
    FROM public.products p
    WHERE p.product_id IN (
      SELECT entity_id FROM public.ai_insight_trends WHERE demand_level='rising'
    )
    ON CONFLICT DO NOTHING;

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'ai_recommendation_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_ai_recommendation_job(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 725 (class 1255 OID 22549)
-- Name: fn_run_alerts_and_revenue_protection(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_alerts_and_revenue_protection() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE n1 INT; n2 INT;
BEGIN
  n1 := public.fn_escalate_budget_alerts();
  PERFORM public.fn_process_alert_escalations(50);
  n2 := public.fn_revenue_protection_cycle();
  RAISE NOTICE '✅ Escalated %, Revenue protection actions %', n1, n2;
END;
$$;


ALTER FUNCTION public.fn_run_alerts_and_revenue_protection() OWNER TO postgres;

--
-- TOC entry 762 (class 1255 OID 21958)
-- Name: fn_run_bias_audit(bigint, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_bias_audit(p_tenant_id bigint, p_model_type text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_now TIMESTAMPTZ := now();
BEGIN
  -- Clear recent audit window for idempotency (optional)
  DELETE FROM public.ai_bias_audit_results
  WHERE tenant_id = p_tenant_id AND model_type = p_model_type
    AND created_at >= v_now - INTERVAL '1 hour';

  -- Insert aggregated metrics by action_type
  INSERT INTO public.ai_bias_audit_results (tenant_id, model_type, segment_key, segment_value, metric_name, metric_value, p_value, created_at)
  SELECT
    p_tenant_id, p_model_type,
    'action_type'::text AS segment_key,
    e.action_type::text AS segment_value,
    'avg_confidence'::text AS metric_name,
    ROUND(AVG(COALESCE(e.confidence, 0))::numeric, 4) AS metric_value,
    0.050000 AS p_value,
    v_now
  FROM public.ai_decision_events e
  WHERE e.tenant_id = p_tenant_id
    AND e.created_at >= v_now - INTERVAL '7 days'
  GROUP BY e.action_type;

  -- Positive rate proxy by reward > 1 (improvement)
  INSERT INTO public.ai_bias_audit_results (tenant_id, model_type, segment_key, segment_value, metric_name, metric_value, p_value, created_at)
  SELECT
    p_tenant_id, p_model_type,
    'action_type', e.action_type,
    'positive_rate',
    ROUND(AVG(CASE WHEN COALESCE(e.actual_reward,0) > 1 THEN 1.0 ELSE 0.0 END)::numeric, 4),
    0.050000,
    v_now
  FROM public.ai_decision_events e
  WHERE e.tenant_id = p_tenant_id
    AND e.created_at >= v_now - INTERVAL '7 days'
  GROUP BY e.action_type;

  -- Compute fairness ratios and store
  PERFORM public.fn_compute_fairness_scores(p_tenant_id, p_model_type);
END;
$$;


ALTER FUNCTION public.fn_run_bias_audit(p_tenant_id bigint, p_model_type text) OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 21260)
-- Name: fn_run_churn_ai_job(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_churn_ai_job(p_days_back integer DEFAULT 90) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status)
  VALUES ('churn_ai_job', now(), 'running')
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_compute_churn_predictions(p_days_back);
    PERFORM public.fn_generate_retention_actions();

    -- Log simple model metrics (placeholder values)
    INSERT INTO public.ai_churn_model_metrics (accuracy, precision, recall, f1_score)
    VALUES (0.85, 0.78, 0.81, 0.79);

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'churn_ai_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_churn_ai_job(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 738 (class 1255 OID 21433)
-- Name: fn_run_compliance_ai_job(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_compliance_ai_job() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status)
  VALUES ('compliance_ai_job', now(), 'running')
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_monitor_governance_health();
    PERFORM public.fn_adapt_policy_from_alerts();

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'compliance_ai_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_compliance_ai_job() OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 22595)
-- Name: fn_run_compliance_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_compliance_cycle() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE n1 INT; n2 INT;
BEGIN
  n1 := public.fn_check_compliance();
  n2 := public.fn_self_heal_orchestrator();
  RAISE NOTICE '✅ Compliance findings: %, Auto-fixes applied: %', n1, n2;
END;
$$;


ALTER FUNCTION public.fn_run_compliance_cycle() OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 20912)
-- Name: fn_run_daily_kpi_job(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_daily_kpi_job(p_for date DEFAULT ((now())::date - 1)) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status, details)
  VALUES ('daily_kpi_job', now(), 'running', jsonb_build_object('for', p_for))
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_compute_daily_kpis(p_for, p_for);
    PERFORM public.fn_flag_kpi_anomalies();

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'daily_kpi_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_daily_kpi_job(p_for date) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 19564)
-- Name: fn_run_data_integrity_check(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_data_integrity_check() RETURNS TABLE(checked_at timestamp with time zone, missing_user_in_orders bigint, missing_shop_in_orders bigint, orphan_payments bigint, orphan_refunds bigint, orphan_deliveries bigint, invalid_stock_reference bigint)
    LANGUAGE sql
    AS $$
  SELECT * FROM public.v_data_integrity_summary;
$$;


ALTER FUNCTION public.fn_run_data_integrity_check() OWNER TO postgres;

--
-- TOC entry 768 (class 1255 OID 21806)
-- Name: fn_run_economic_simulation(bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_economic_simulation(p_scenario_id bigint, p_tenant_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_scenario RECORD;
  v_run_id BIGINT;
BEGIN
  SELECT * INTO v_scenario FROM public.ai_scenario_library WHERE scenario_id = p_scenario_id;
  IF v_scenario IS NULL THEN
    RAISE EXCEPTION 'Scenario % not found', p_scenario_id;
  END IF;

  INSERT INTO public.ai_simulation_runs (scenario_id, tenant_id, status)
  VALUES (p_scenario_id, p_tenant_id, 'running')
  RETURNING run_id INTO v_run_id;

  -- Simulate impact based on scenario type
  IF v_scenario.scenario_type = 'inflation' THEN
    INSERT INTO public.ai_simulation_results(run_id, kpi_name, base_value, simulated_value, delta_percent, confidence)
    SELECT v_run_id, 'revenue', f.avg_reward, f.avg_reward * (1 - (v_scenario.assumptions->>'inflation')::NUMERIC), 
           -(v_scenario.assumptions->>'inflation')::NUMERIC * 100, 0.9
    FROM public.ai_model_performance f WHERE f.tenant_id = p_tenant_id;

  ELSIF v_scenario.scenario_type = 'demand_spike' THEN
    INSERT INTO public.ai_simulation_results(run_id, kpi_name, base_value, simulated_value, delta_percent, confidence)
    SELECT v_run_id, 'sales', f.avg_reward, f.avg_reward * (1 + (v_scenario.assumptions->>'demand_boost')::NUMERIC),
           (v_scenario.assumptions->>'demand_boost')::NUMERIC * 100, 0.95
    FROM public.ai_model_performance f WHERE f.tenant_id = p_tenant_id;

  ELSIF v_scenario.scenario_type = 'supply_shock' THEN
    INSERT INTO public.ai_simulation_results(run_id, kpi_name, base_value, simulated_value, delta_percent, confidence)
    SELECT v_run_id, 'inventory', f.avg_reward, f.avg_reward * (1 - (v_scenario.assumptions->>'supply_drop')::NUMERIC),
           -(v_scenario.assumptions->>'supply_drop')::NUMERIC * 100, 0.88
    FROM public.ai_model_performance f WHERE f.tenant_id = p_tenant_id;
  END IF;

  UPDATE public.ai_simulation_runs
  SET end_time = now(), status = 'completed'
  WHERE run_id = v_run_id;

  RAISE NOTICE '✅ Simulation % for tenant % completed successfully.', v_scenario.scenario_name, p_tenant_id;
END;
$$;


ALTER FUNCTION public.fn_run_economic_simulation(p_scenario_id bigint, p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 690 (class 1255 OID 20976)
-- Name: fn_run_enterprise_analytics_job(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_enterprise_analytics_job(p_days_back integer DEFAULT 30) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status, details)
  VALUES ('enterprise_analytics_job', now(), 'running', jsonb_build_object('days_back', p_days_back))
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_update_kpi_correlations(p_days_back);
    PERFORM public.fn_generate_kpi_explanations(p_days_back, 0.6);

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'enterprise_analytics_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_enterprise_analytics_job(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 21910)
-- Name: fn_run_federated_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_federated_cycle() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_round_id BIGINT;
  v_model_id BIGINT;
BEGIN
  INSERT INTO public.ai_federated_rounds (status) VALUES ('running')
  RETURNING round_id INTO v_round_id;

  RAISE NOTICE '🏁 Federated learning round % started.', v_round_id;

  PERFORM public.fn_submit_federated_update(v_round_id, 1, 0.91, 0.08, '{"lr":0.001,"wd":0.01}');
  PERFORM public.fn_submit_federated_update(v_round_id, 2, 0.89, 0.09, '{"lr":0.002,"wd":0.012}');

  v_model_id := public.fn_aggregate_federated_model(v_round_id);
  PERFORM public.fn_broadcast_global_model(v_model_id);

  RAISE NOTICE '✅ Federated cycle % finished successfully.', v_round_id;
END;
$$;


ALTER FUNCTION public.fn_run_federated_cycle() OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 21755)
-- Name: fn_run_global_intelligence_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_global_intelligence_cycle() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_tenant RECORD;
BEGIN
  -- Apply market enrichment
  PERFORM public.fn_enrich_ai_forecasts_with_market();

  -- Compute correlations for all tenants
  FOR v_tenant IN SELECT DISTINCT tenant_id FROM public.tenant_policies LOOP
    INSERT INTO public.ai_rl_feedback(tenant_id, model_type, reference_id, forecast_date, predicted_value, actual_value, reward_score)
    SELECT v_tenant.tenant_id, 'market_intel', NULL, CURRENT_DATE, 1, 1, 1
    ON CONFLICT DO NOTHING;
    PERFORM public.fn_compute_market_impact(v_tenant.tenant_id);
  END LOOP;

  RAISE NOTICE '🌍 Global market intelligence cycle completed successfully.';
END;
$$;


ALTER FUNCTION public.fn_run_global_intelligence_cycle() OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 20943)
-- Name: fn_run_kpi_forecast_job(date, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_kpi_forecast_job(p_from date DEFAULT (now())::date, p_days_ahead integer DEFAULT 14) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- ✅ Cast to DATE to match fn_build_kpi_forecast signature
  PERFORM public.fn_build_kpi_forecast(p_from, (p_from + (p_days_ahead || ' days')::interval)::date, 60, 1.96);

  PERFORM public.fn_update_kpi_thresholds(30, 3.0);
END;
$$;


ALTER FUNCTION public.fn_run_kpi_forecast_job(p_from date, p_days_ahead integer) OWNER TO postgres;

--
-- TOC entry 790 (class 1255 OID 22153)
-- Name: fn_run_predictive_maintenance(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_predictive_maintenance() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE issues INT; fixes INT;
BEGIN
    issues := public.fn_analyze_system_health();
    fixes := public.fn_auto_recover_system();
    RAISE NOTICE '✅ Predictive maintenance found % issues, executed % fixes', issues, fixes;
END;
$$;


ALTER FUNCTION public.fn_run_predictive_maintenance() OWNER TO postgres;

--
-- TOC entry 787 (class 1255 OID 21566)
-- Name: fn_run_rl_training_cycle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_rl_training_cycle() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_tenant RECORD;
  v_model TEXT;
BEGIN
  FOR v_tenant IN SELECT DISTINCT tenant_id FROM public.tenant_policies LOOP
    FOREACH v_model IN ARRAY ARRAY['price', 'inventory', 'marketing'] LOOP
      PERFORM public.fn_update_policy_weights(v_tenant.tenant_id, v_model);
    END LOOP;
  END LOOP;

  -- Aggregate results to performance table
  INSERT INTO public.ai_model_performance(tenant_id, model_type, avg_reward, avg_accuracy, samples, updated_at)
  SELECT tenant_id, model_type,
         AVG(reward_score) AS avg_reward,
         STDDEV_POP(reward_score) AS avg_accuracy,
         COUNT(*) AS samples,
         now()
  FROM public.ai_rl_feedback
  WHERE created_at >= now() - INTERVAL '7 days'
  GROUP BY tenant_id, model_type
  ON CONFLICT DO NOTHING;
END;
$$;


ALTER FUNCTION public.fn_run_rl_training_cycle() OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 22334)
-- Name: fn_run_scheduled_jobs(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_scheduled_jobs() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN SELECT * FROM public.sys_jobs WHERE enabled = TRUE LOOP
    RAISE NOTICE '▶ Running job: %', r.job_name;

    -- Execute core job logic by name
    CASE r.job_name
      WHEN 'collect_metrics' THEN
        PERFORM public.fn_collect_system_metrics();
      WHEN 'analyze_health' THEN
        PERFORM public.fn_analyze_system_health();
      WHEN 'refresh_ai_models' THEN
        PERFORM public.fn_run_ai_recommendation_job(30);
      ELSE
        RAISE NOTICE '⚠️ Unknown job name: %', r.job_name;
    END CASE;

    -- Update job status & timestamps
    UPDATE public.sys_jobs
      SET last_run = now(),
          next_run = now() + COALESCE(r.schedule_interval, '1 hour'),
          status = 'completed',
          last_result = 'success'
      WHERE job_id = r.job_id;
  END LOOP;

  RAISE NOTICE '✅ fn_run_scheduled_jobs executed successfully.';
END;
$$;


ALTER FUNCTION public.fn_run_scheduled_jobs() OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 21330)
-- Name: fn_run_self_learning_job(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_self_learning_job() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_job_id BIGINT;
BEGIN
  INSERT INTO public.job_run_history(job_name, started_at, status)
  VALUES ('self_learning_job', now(), 'running')
  RETURNING job_id INTO v_job_id;

  BEGIN
    PERFORM public.fn_auto_learn_from_outcomes(30, 'rfm_churn_v1');
    PERFORM public.fn_recompute_churn_with_weights(90, 'rfm_churn_v1');
    PERFORM public.fn_generate_retention_actions();

    UPDATE public.job_run_history
    SET finished_at = now(), status = 'success'
    WHERE job_id = v_job_id;
  EXCEPTION WHEN OTHERS THEN
    UPDATE public.job_run_history
    SET finished_at = now(), status = 'failed', details = jsonb_build_object('error', SQLERRM)
    WHERE job_id = v_job_id;
    RAISE NOTICE 'self_learning_job failed: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION public.fn_run_self_learning_job() OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 21856)
-- Name: fn_run_strategy_evolution_cycle(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_strategy_evolution_cycle(p_tenant_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_best_id BIGINT;
  v_new_id BIGINT;
  v_best_score NUMERIC;
  v_new_score NUMERIC;
  v_improvement NUMERIC;
BEGIN
  v_best_id := (SELECT strategy_id FROM public.ai_strategy_versions
                WHERE tenant_id = p_tenant_id AND is_active = TRUE
                ORDER BY performance_score DESC LIMIT 1);

  v_new_id := public.fn_generate_new_strategy(p_tenant_id);

  IF v_new_id IS NOT NULL THEN
    v_best_score := COALESCE(public.fn_evaluate_strategy_fitness(v_best_id), 0);
    v_new_score := COALESCE(public.fn_evaluate_strategy_fitness(v_new_id), 0);
    v_improvement := v_new_score - v_best_score;

    UPDATE public.ai_strategy_evolution_history
    SET improvement_pct = ROUND(v_improvement * 100, 2)
    WHERE child_strategy_id = v_new_id;

    IF v_improvement > 0 THEN
      UPDATE public.ai_strategy_versions SET is_active = FALSE WHERE tenant_id = p_tenant_id;
      UPDATE public.ai_strategy_versions SET is_active = TRUE WHERE strategy_id = v_new_id;
      RAISE NOTICE '🚀 New strategy % promoted with improvement %.2f%%', v_new_id, v_improvement * 100;
    ELSE
      RAISE NOTICE '⚙️ New strategy % tested but not promoted (%.2f%% improvement)', v_new_id, v_improvement * 100;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION public.fn_run_strategy_evolution_cycle(p_tenant_id bigint) OWNER TO postgres;

--
-- TOC entry 751 (class 1255 OID 22138)
-- Name: fn_run_webhook_health_job(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_run_webhook_health_job() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE updated INT; disabled INT;
BEGIN
    updated := public.fn_update_webhook_health();
    disabled := public.fn_auto_manage_webhooks();
    RAISE NOTICE '✅ Webhook health updated %, disabled % endpoints', updated, disabled;
END;
$$;


ALTER FUNCTION public.fn_run_webhook_health_job() OWNER TO postgres;

--
-- TOC entry 771 (class 1255 OID 22590)
-- Name: fn_self_heal_orchestrator(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_self_heal_orchestrator() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  r RECORD;
  v_fixed INT := 0;
BEGIN
  -- run checks and capture findings
  PERFORM public.fn_check_compliance();

  FOR r IN
    SELECT * FROM public.sys_compliance_findings
    WHERE fixed = FALSE AND auto_fix_possible = TRUE
    ORDER BY finding_id
  LOOP
    BEGIN
      -- RLS enable
      IF r.category='rls' THEN
        EXECUTE format('ALTER TABLE %I.%I ENABLE ROW LEVEL SECURITY', r.object_schema, r.object_name);
        INSERT INTO public.sys_self_heal_actions(action_type, target_schema, target_object, details)
        VALUES ('enable_rls', r.object_schema, r.object_name, 'RLS enabled');
        v_fixed := v_fixed + 1;
      END IF;

      -- Tenant policy creation (simple USING on tenant_id)
      IF r.category='policy' THEN
        EXECUTE format(
          'CREATE POLICY tenant_isolation_policy ON %I.%I USING (tenant_id = current_setting(''app.tenant_id'')::bigint)',
          r.object_schema, r.object_name
        );
        INSERT INTO public.sys_self_heal_actions(action_type, target_schema, target_object, details)
        VALUES ('create_policy', r.object_schema, r.object_name, 'Tenant isolation policy created');
        v_fixed := v_fixed + 1;
      END IF;

      -- MV refresh
      IF r.category='mv' AND r.object_name='mv_stream_sales_5m' THEN
        BEGIN
          REFRESH MATERIALIZED VIEW CONCURRENTLY public.mv_stream_sales_5m;
        EXCEPTION WHEN OTHERS THEN
          REFRESH MATERIALIZED VIEW public.mv_stream_sales_5m;
        END;
        INSERT INTO public.sys_self_heal_actions(action_type, target_schema, target_object, details)
        VALUES ('refresh_mv', 'public', 'mv_stream_sales_5m', 'Refreshed stale MV');
        v_fixed := v_fixed + 1;
      END IF;

      -- Privilege fixes
      IF r.category='privilege' THEN
        EXECUTE format('REVOKE INSERT, UPDATE, DELETE ON %I.%I FROM PUBLIC', r.object_schema, r.object_name);
        INSERT INTO public.sys_self_heal_actions(action_type, target_schema, target_object, details)
        VALUES ('repair_privileges', r.object_schema, r.object_name, 'PUBLIC write revoked');
        v_fixed := v_fixed + 1;
      END IF;

      -- mark fixed
      UPDATE public.sys_compliance_findings
      SET fixed = TRUE, fixed_at = now()
      WHERE finding_id = r.finding_id;

    EXCEPTION WHEN OTHERS THEN
      INSERT INTO public.sys_self_heal_actions(action_type, target_schema, target_object, status, details)
      VALUES ('error', r.object_schema, r.object_name, 'failed', SQLERRM);
    END;
  END LOOP;

  RETURN v_fixed;
END;
$$;


ALTER FUNCTION public.fn_self_heal_orchestrator() OWNER TO postgres;

--
-- TOC entry 766 (class 1255 OID 21907)
-- Name: fn_submit_federated_update(bigint, bigint, numeric, numeric, jsonb); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_submit_federated_update(p_round_id bigint, p_tenant_id bigint, p_local_accuracy numeric, p_local_loss numeric, p_weight_delta jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_federated_updates (round_id, tenant_id, local_accuracy, local_loss, weight_delta)
  VALUES (p_round_id, p_tenant_id, p_local_accuracy, p_local_loss, p_weight_delta);
  RAISE NOTICE '✅ Tenant % submitted federated update for round %', p_tenant_id, p_round_id;
END;
$$;


ALTER FUNCTION public.fn_submit_federated_update(p_round_id bigint, p_tenant_id bigint, p_local_accuracy numeric, p_local_loss numeric, p_weight_delta jsonb) OWNER TO postgres;

--
-- TOC entry 785 (class 1255 OID 22394)
-- Name: fn_update_heartbeat(text, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_heartbeat(p_component text, p_latency numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.sys_heartbeat(tenant_id, component, last_ping, status, latency_ms)
    VALUES (1, p_component, now(), 'ok', p_latency)
    ON CONFLICT (tenant_id, component)
    DO UPDATE SET last_ping = now(), status='ok', latency_ms=p_latency;
END;
$$;


ALTER FUNCTION public.fn_update_heartbeat(p_component text, p_latency numeric) OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 20974)
-- Name: fn_update_kpi_correlations(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_kpi_correlations(p_window_days integer DEFAULT 30) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.kpi_correlations AS kc (tenant_id, kpi_x, kpi_y, correlation, period_days, calculated_at)
  SELECT
    t.tenant_id,
    x.kpi_name AS kpi_x,
    y.kpi_name AS kpi_y,
    CORR(x.kpi_value, y.kpi_value) AS correlation,
    p_window_days,
    now()
  FROM public.v_kpi_unpivot x
  JOIN public.v_kpi_unpivot y
    ON x.tenant_id = y.tenant_id
   AND x.snapshot_date = y.snapshot_date
   AND x.kpi_name < y.kpi_name  -- avoid duplicates and self-correlation
  JOIN (SELECT DISTINCT tenant_id FROM public.v_kpi_unpivot) t ON t.tenant_id = x.tenant_id
  WHERE x.snapshot_date >= (now()::date - make_interval(days => p_window_days))
  GROUP BY t.tenant_id, x.kpi_name, y.kpi_name
  ON CONFLICT (tenant_id, kpi_x, kpi_y, period_days)
  DO UPDATE SET
    correlation = EXCLUDED.correlation,
    calculated_at = now();
END;
$$;


ALTER FUNCTION public.fn_update_kpi_correlations(p_window_days integer) OWNER TO postgres;

--
-- TOC entry 701 (class 1255 OID 20942)
-- Name: fn_update_kpi_thresholds(integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_kpi_thresholds(p_window_days integer DEFAULT 30, p_z numeric DEFAULT 3.0) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.kpi_thresholds AS kt (tenant_id, kpi_name, mean_30d, stddev_30d, lower_alert, upper_alert, z_used, updated_at)
  SELECT
    tenant_id,
    kpi_name,
    AVG(kpi_value) AS mean_30d,
    STDDEV_POP(kpi_value) AS stddev_30d,
    AVG(kpi_value) - p_z * STDDEV_POP(kpi_value) AS lower_alert,
    AVG(kpi_value) + p_z * STDDEV_POP(kpi_value) AS upper_alert,
    p_z,
    now()
  FROM public.v_kpi_unpivot
  WHERE snapshot_date >= (now()::date - make_interval(days => p_window_days))
    AND kpi_value IS NOT NULL
  GROUP BY tenant_id, kpi_name
  ON CONFLICT (tenant_id, kpi_name)
  DO UPDATE SET
    mean_30d    = EXCLUDED.mean_30d,
    stddev_30d  = EXCLUDED.stddev_30d,
    lower_alert = EXCLUDED.lower_alert,
    upper_alert = EXCLUDED.upper_alert,
    z_used      = EXCLUDED.z_used,
    updated_at  = now();
END;
$$;


ALTER FUNCTION public.fn_update_kpi_thresholds(p_window_days integer, p_z numeric) OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 21565)
-- Name: fn_update_policy_weights(bigint, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_policy_weights(p_tenant_id bigint, p_model_type text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_recent NUMERIC;
  v_prev NUMERIC;
  v_alpha NUMERIC;
BEGIN
  SELECT COALESCE(AVG(reward_score), 0) INTO v_recent
  FROM public.ai_rl_feedback
  WHERE tenant_id = p_tenant_id
    AND model_type = p_model_type
    AND created_at >= now() - INTERVAL '7 days';

  SELECT learning_rate, weight_accuracy INTO v_alpha, v_prev
  FROM public.ai_rl_policy_weights
  WHERE tenant_id = p_tenant_id AND model_type = p_model_type;

  IF NOT FOUND THEN
    INSERT INTO public.ai_rl_policy_weights(tenant_id, model_type, weight_demand, weight_margin, weight_accuracy, learning_rate)
    VALUES (p_tenant_id, p_model_type, 1.0, 1.0, v_recent, 0.05);
    RETURN;
  END IF;

  -- Update weight with Q-learning incremental average
  UPDATE public.ai_rl_policy_weights
  SET weight_accuracy = weight_accuracy + v_alpha * (v_recent - weight_accuracy),
      last_updated = now()
  WHERE tenant_id = p_tenant_id AND model_type = p_model_type;
END;
$$;


ALTER FUNCTION public.fn_update_policy_weights(p_tenant_id bigint, p_model_type text) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 21122)
-- Name: fn_update_trend_insights(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_trend_insights(p_days_back integer DEFAULT 30) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.ai_insight_trends (snapshot_date, tenant_id, entity_type, entity_id, trend_score, momentum, demand_level, forecast_gap, created_at)
  SELECT
    k.snapshot_date,
    k.tenant_id,
    'product' AS entity_type,
    p.product_id AS entity_id,
    ROUND((COALESCE(SUM(oi.quantity),0) / NULLIF(AVG(SUM(oi.quantity)) OVER (PARTITION BY p.product_id ORDER BY k.snapshot_date ROWS BETWEEN 7 PRECEDING AND CURRENT ROW),0)),2) AS trend_score,
    ROUND((SUM(oi.quantity) - LAG(SUM(oi.quantity)) OVER (PARTITION BY p.product_id ORDER BY k.snapshot_date))::numeric,2) AS momentum,
    CASE
      WHEN SUM(oi.quantity) > LAG(SUM(oi.quantity)) OVER (PARTITION BY p.product_id ORDER BY k.snapshot_date) THEN 'rising'
      WHEN SUM(oi.quantity) < LAG(SUM(oi.quantity)) OVER (PARTITION BY p.product_id ORDER BY k.snapshot_date) THEN 'falling'
      ELSE 'stable'
    END AS demand_level,
    0.0 AS forecast_gap,
    now()
  FROM public.orders o
  JOIN public.order_items oi ON o.order_id = oi.order_id
  JOIN public.products p ON oi.product_id = p.product_id
  LEFT JOIN public.kpi_daily_snapshot k ON k.snapshot_date = o.created_at::date
  WHERE o.created_at::date >= (now()::date - p_days_back)
  GROUP BY k.snapshot_date, k.tenant_id, p.product_id;
END;
$$;


ALTER FUNCTION public.fn_update_trend_insights(p_days_back integer) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 20804)
-- Name: fn_update_user_behavior_metrics(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_user_behavior_metrics(p_days integer DEFAULT 90) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Upsert views/add_to_cart from user_activity_logs
  INSERT INTO public.user_behavior_metrics AS ubm (user_id, total_views, total_add_to_cart, last_active, rolling_7d_views, updated_at)
  SELECT
    a.user_id,
    COUNT(*) FILTER (WHERE a.action = 'view'),
    COUNT(*) FILTER (WHERE a.action = 'add_to_cart'),
    MAX(a.created_at),
    COUNT(*) FILTER (WHERE a.action = 'view' AND a.created_at >= now() - make_interval(days => 7)),
    now()
  FROM public.user_activity_logs a
  WHERE a.created_at >= now() - make_interval(days => p_days)
  GROUP BY a.user_id
  ON CONFLICT (user_id) DO UPDATE
    SET total_views = COALESCE(ubm.total_views,0) + EXCLUDED.total_views,
        total_add_to_cart = COALESCE(ubm.total_add_to_cart,0) + EXCLUDED.total_add_to_cart,
        last_active = GREATEST(ubm.last_active, EXCLUDED.last_active),
        rolling_7d_views = EXCLUDED.rolling_7d_views,
        updated_at = now();

  -- Upsert purchases from orders
  INSERT INTO public.user_behavior_metrics AS ubm (user_id, total_purchases, rolling_7d_purchases, avg_days_between_orders, updated_at, last_active)
  SELECT
    o.user_id,
    COUNT(*)::int,
    COUNT(*) FILTER (WHERE COALESCE(p.paid_at, o.created_at) >= now() - make_interval(days => 7))::int,
    CASE
      WHEN COUNT(*) FILTER (WHERE p.paid_at IS NOT NULL) >= 2 THEN
        AVG(EXTRACT(EPOCH FROM (p.paid_at - LAG(p.paid_at) OVER (PARTITION BY o.user_id ORDER BY p.paid_at))) / 86400.0)
      ELSE NULL
    END::numeric(10,2),
    now(),
    MAX(COALESCE(p.paid_at, o.created_at))
  FROM public.orders o
  LEFT JOIN public.payments p ON p.order_id = o.order_id
  WHERE o.user_id IS NOT NULL
    AND COALESCE(p.paid_at, o.created_at) >= now() - make_interval(days => p_days)
  GROUP BY o.user_id
  ON CONFLICT (user_id) DO UPDATE
    SET total_purchases = COALESCE(ubm.total_purchases,0) + EXCLUDED.total_purchases,
        rolling_7d_purchases = EXCLUDED.rolling_7d_purchases,
        avg_days_between_orders = COALESCE(EXCLUDED.avg_days_between_orders, ubm.avg_days_between_orders),
        last_active = GREATEST(ubm.last_active, EXCLUDED.last_active),
        updated_at = now();
END;
$$;


ALTER FUNCTION public.fn_update_user_behavior_metrics(p_days integer) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 22131)
-- Name: fn_update_webhook_health(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_update_webhook_health() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_count INT := 0;
BEGIN
    INSERT INTO public.ai_webhook_health (webhook_id, success_rate, avg_latency_ms,
                                          confidence_score, last_evaluation, status, consecutive_failures)
    SELECT
        w.webhook_id,
        ROUND(100.0 * SUM(CASE WHEN d.status='success' THEN 1 ELSE 0 END) / NULLIF(COUNT(d.delivery_id),0), 2) AS success_rate,
        COALESCE(AVG(EXTRACT(MILLISECOND FROM (d.last_attempt - d.created_at))), 0) AS avg_latency_ms,
        ROUND(LEAST(1.0, (SUM(CASE WHEN d.status='success' THEN 1 ELSE 0 END)::NUMERIC / GREATEST(1, COUNT(d.delivery_id))) + 0.1), 2) AS confidence_score,
        now(),
        CASE
            WHEN (SUM(CASE WHEN d.status='failed' THEN 1 ELSE 0 END) > COUNT(*) * 0.3) THEN 'critical'
            WHEN (SUM(CASE WHEN d.status='failed' THEN 1 ELSE 0 END) > COUNT(*) * 0.1) THEN 'warning'
            ELSE 'healthy'
        END AS status,
        COALESCE(MAX(CASE WHEN d.status='failed' THEN d.attempts ELSE 0 END),0) AS consecutive_failures
    FROM public.rt_webhook_endpoints w
    LEFT JOIN public.rt_webhook_deliveries d ON d.webhook_id = w.webhook_id
    GROUP BY w.webhook_id
    ON CONFLICT (webhook_id) DO UPDATE
    SET success_rate = EXCLUDED.success_rate,
        avg_latency_ms = EXCLUDED.avg_latency_ms,
        confidence_score = EXCLUDED.confidence_score,
        last_evaluation = EXCLUDED.last_evaluation,
        status = EXCLUDED.status,
        consecutive_failures = EXCLUDED.consecutive_failures;

    GET DIAGNOSTICS v_count = ROW_COUNT;
    RETURN v_count;
END;
$$;


ALTER FUNCTION public.fn_update_webhook_health() OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 22712)
-- Name: fn_upsert_telegram_user(bigint, text, text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_upsert_telegram_user(p_telegram_id bigint, p_username text, p_first_name text, p_last_name text, p_language_code text, p_is_bot boolean DEFAULT false) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO public.users (telegram_id, username, first_name, last_name, language_code, is_bot, created_at, last_seen)
    VALUES (p_telegram_id, p_username, p_first_name, p_last_name, p_language_code, p_is_bot, now(), now())
    ON CONFLICT (telegram_id)
    DO UPDATE SET
        username = EXCLUDED.username,
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        language_code = EXCLUDED.language_code,
        is_bot = EXCLUDED.is_bot,
        last_seen = now();
END;
$$;


ALTER FUNCTION public.fn_upsert_telegram_user(p_telegram_id bigint, p_username text, p_first_name text, p_last_name text, p_language_code text, p_is_bot boolean) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 20007)
-- Name: refresh_financial_summary(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.refresh_financial_summary() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY public.financial_summary;
END;
$$;


ALTER FUNCTION public.refresh_financial_summary() OWNER TO postgres;

--
-- TOC entry 773 (class 1255 OID 19664)
-- Name: refresh_sales_by_day(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.refresh_sales_by_day() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY public.sales_by_day;
END;
$$;


ALTER FUNCTION public.refresh_sales_by_day() OWNER TO postgres;

--
-- TOC entry 747 (class 1255 OID 19448)
-- Name: refresh_shop_sales_summary(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.refresh_shop_sales_summary() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY public.shop_sales_summary;
END;
$$;


ALTER FUNCTION public.refresh_shop_sales_summary() OWNER TO postgres;

--
-- TOC entry 775 (class 1255 OID 21021)
-- Name: trg_auto_enqueue_alert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_auto_enqueue_alert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE r RECORD;
BEGIN
  FOR r IN
    SELECT * FROM public.alert_rules
    WHERE active = TRUE
      AND (NEW.kpi_name = kpi_name OR kpi_name IS NULL)
      AND (NEW.tenant_id = tenant_id OR tenant_id IS NULL)
      AND (NEW.severity >= severity_min)
  LOOP
    PERFORM public.fn_enqueue_alert(
      r.rule_id,
      NEW.tenant_id,
      NEW.snapshot_date,
      NEW.kpi_name,
      NEW.severity,
      NEW.reason_summary,
      jsonb_build_object(
        'observed_value', NEW.observed_value,
        'expected_value', NEW.expected_value,
        'deviation_pct', NEW.deviation_pct,
        'correlation', NEW.correlation,
        'related_kpi', NEW.related_kpi
      )
    );
  END LOOP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_auto_enqueue_alert() OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 22027)
-- Name: trg_emit_order_created(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_emit_order_created() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM public.fn_emit_event('order.created', NEW.order_id::text, to_jsonb(NEW));
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_emit_order_created() OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 22028)
-- Name: trg_emit_payment_received(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_emit_payment_received() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM public.fn_emit_event('payment.received', NEW.payment_id::text, to_jsonb(NEW));
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_emit_payment_received() OWNER TO postgres;

--
-- TOC entry 778 (class 1255 OID 22102)
-- Name: trg_queue_webhook(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_queue_webhook() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.status = 'published' THEN
        PERFORM public.fn_queue_webhook_event(NEW.event_id);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_queue_webhook() OWNER TO postgres;

--
-- TOC entry 430 (class 1259 OID 20848)
-- Name: ab_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_assignments (
    user_id bigint NOT NULL,
    experiment_id bigint NOT NULL,
    variant character varying(150) NOT NULL,
    assigned_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ab_assignments OWNER TO postgres;

--
-- TOC entry 429 (class 1259 OID 20836)
-- Name: ab_experiments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_experiments (
    experiment_id bigint NOT NULL,
    key character varying(150) NOT NULL,
    name character varying(255),
    description text,
    variants jsonb NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ab_experiments OWNER TO postgres;

--
-- TOC entry 428 (class 1259 OID 20835)
-- Name: ab_experiments_experiment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_experiments_experiment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ab_experiments_experiment_id_seq OWNER TO postgres;

--
-- TOC entry 6233 (class 0 OID 0)
-- Dependencies: 428
-- Name: ab_experiments_experiment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ab_experiments_experiment_id_seq OWNED BY public.ab_experiments.experiment_id;


--
-- TOC entry 267 (class 1259 OID 16762)
-- Name: admin_login_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_login_sessions (
    session_id bigint NOT NULL,
    admin_id bigint,
    login_time timestamp with time zone,
    logout_time timestamp with time zone,
    ip_address text,
    device_info text
);


ALTER TABLE public.admin_login_sessions OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16761)
-- Name: admin_login_sessions_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_login_sessions ALTER COLUMN session_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_login_sessions_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 16748)
-- Name: admin_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_logs (
    log_id bigint NOT NULL,
    admin_id bigint,
    action text,
    entity_type text,
    entity_id bigint,
    details jsonb,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admin_logs OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 16747)
-- Name: admin_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_logs ALTER COLUMN log_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 16876)
-- Name: admin_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_notifications (
    notification_id bigint NOT NULL,
    admin_id bigint,
    title text,
    message text,
    status text DEFAULT 'unread'::text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admin_notifications OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16875)
-- Name: admin_notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_notifications ALTER COLUMN notification_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 16699)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    permission_id bigint NOT NULL,
    permission_key text NOT NULL,
    description text
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16698)
-- Name: admin_permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_permissions ALTER COLUMN permission_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_permissions_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 345 (class 1259 OID 17718)
-- Name: admin_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_reports (
    report_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    report_type character varying(100),
    payload jsonb,
    generated_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.admin_reports OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 17717)
-- Name: admin_reports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_reports_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_reports_report_id_seq OWNER TO postgres;

--
-- TOC entry 6234 (class 0 OID 0)
-- Dependencies: 344
-- Name: admin_reports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_reports_report_id_seq OWNED BY public.admin_reports.report_id;


--
-- TOC entry 261 (class 1259 OID 16709)
-- Name: admin_role_permission_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_permission_map (
    map_id bigint NOT NULL,
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admin_role_permission_map OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16708)
-- Name: admin_role_permission_map_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_role_permission_map ALTER COLUMN map_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_role_permission_map_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 16688)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    role_id bigint NOT NULL,
    role_name text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16687)
-- Name: admin_roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_roles ALTER COLUMN role_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 343 (class 1259 OID 17706)
-- Name: admin_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_tasks (
    task_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    assigned_to bigint,
    priority character varying(10) DEFAULT 'medium'::character varying,
    status character varying(20) DEFAULT 'open'::character varying,
    due_date timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.admin_tasks OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 17705)
-- Name: admin_tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_tasks_task_id_seq OWNER TO postgres;

--
-- TOC entry 6235 (class 0 OID 0)
-- Dependencies: 342
-- Name: admin_tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_tasks_task_id_seq OWNED BY public.admin_tasks.task_id;


--
-- TOC entry 263 (class 1259 OID 16728)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    admin_id bigint NOT NULL,
    username text NOT NULL,
    email text,
    password_hash text,
    role_id bigint,
    status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16727)
-- Name: admins_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admins ALTER COLUMN admin_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admins_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 533 (class 1259 OID 21681)
-- Name: ai_agent_agreements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_agent_agreements (
    agreement_id bigint NOT NULL,
    negotiation_id bigint,
    agreed_action text,
    confidence numeric(5,2),
    expected_reward numeric(10,4),
    executed boolean DEFAULT false,
    executed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_agent_agreements OWNER TO postgres;

--
-- TOC entry 532 (class 1259 OID 21680)
-- Name: ai_agent_agreements_agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_agent_agreements_agreement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_agent_agreements_agreement_id_seq OWNER TO postgres;

--
-- TOC entry 6236 (class 0 OID 0)
-- Dependencies: 532
-- Name: ai_agent_agreements_agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_agent_agreements_agreement_id_seq OWNED BY public.ai_agent_agreements.agreement_id;


--
-- TOC entry 529 (class 1259 OID 21644)
-- Name: ai_agent_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_agent_messages (
    message_id bigint NOT NULL,
    sender_agent_id bigint,
    receiver_agent_id bigint,
    topic character varying(100),
    message_type character varying(50),
    payload jsonb,
    confidence numeric(5,2),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_agent_messages OWNER TO postgres;

--
-- TOC entry 528 (class 1259 OID 21643)
-- Name: ai_agent_messages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_agent_messages_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_agent_messages_message_id_seq OWNER TO postgres;

--
-- TOC entry 6237 (class 0 OID 0)
-- Dependencies: 528
-- Name: ai_agent_messages_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_agent_messages_message_id_seq OWNED BY public.ai_agent_messages.message_id;


--
-- TOC entry 531 (class 1259 OID 21665)
-- Name: ai_agent_negotiations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_agent_negotiations (
    negotiation_id bigint NOT NULL,
    topic character varying(100),
    started_at timestamp with time zone DEFAULT now(),
    closed_at timestamp with time zone,
    status character varying(20) DEFAULT 'open'::character varying,
    consensus_score numeric(6,3),
    dominant_agent bigint,
    summary text
);


ALTER TABLE public.ai_agent_negotiations OWNER TO postgres;

--
-- TOC entry 530 (class 1259 OID 21664)
-- Name: ai_agent_negotiations_negotiation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_agent_negotiations_negotiation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_agent_negotiations_negotiation_id_seq OWNER TO postgres;

--
-- TOC entry 6238 (class 0 OID 0)
-- Dependencies: 530
-- Name: ai_agent_negotiations_negotiation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_agent_negotiations_negotiation_id_seq OWNED BY public.ai_agent_negotiations.negotiation_id;


--
-- TOC entry 527 (class 1259 OID 21632)
-- Name: ai_agent_registry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_agent_registry (
    agent_id bigint NOT NULL,
    agent_name character varying(100) NOT NULL,
    domain character varying(50) NOT NULL,
    confidence_bias numeric(6,3) DEFAULT 1.000,
    reward_weight numeric(6,3) DEFAULT 1.000,
    is_active boolean DEFAULT true,
    registered_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_agent_registry OWNER TO postgres;

--
-- TOC entry 526 (class 1259 OID 21631)
-- Name: ai_agent_registry_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_agent_registry_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_agent_registry_agent_id_seq OWNER TO postgres;

--
-- TOC entry 6239 (class 0 OID 0)
-- Dependencies: 526
-- Name: ai_agent_registry_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_agent_registry_agent_id_seq OWNED BY public.ai_agent_registry.agent_id;


--
-- TOC entry 629 (class 1259 OID 22512)
-- Name: ai_alert_escalations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_alert_escalations (
    escalation_id bigint NOT NULL,
    alert_id bigint,
    tenant_id bigint,
    channel character varying(50) DEFAULT 'webhook'::character varying,
    target text,
    status character varying(30) DEFAULT 'queued'::character varying,
    attempts integer DEFAULT 0,
    last_attempt timestamp with time zone,
    response_code integer,
    response_body text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT ai_alert_escalations_channel_check CHECK (((channel)::text = ANY ((ARRAY['webhook'::character varying, 'email'::character varying, 'inapp'::character varying])::text[])))
);


ALTER TABLE public.ai_alert_escalations OWNER TO postgres;

--
-- TOC entry 628 (class 1259 OID 22511)
-- Name: ai_alert_escalations_escalation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_alert_escalations_escalation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_alert_escalations_escalation_id_seq OWNER TO postgres;

--
-- TOC entry 6240 (class 0 OID 0)
-- Dependencies: 628
-- Name: ai_alert_escalations_escalation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_alert_escalations_escalation_id_seq OWNED BY public.ai_alert_escalations.escalation_id;


--
-- TOC entry 573 (class 1259 OID 21938)
-- Name: ai_bias_audit_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_bias_audit_results (
    audit_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    segment_key text,
    segment_value text,
    metric_name text,
    metric_value numeric(12,4),
    p_value numeric(12,6),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_bias_audit_results OWNER TO postgres;

--
-- TOC entry 572 (class 1259 OID 21937)
-- Name: ai_bias_audit_results_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_bias_audit_results_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_bias_audit_results_audit_id_seq OWNER TO postgres;

--
-- TOC entry 6241 (class 0 OID 0)
-- Dependencies: 572
-- Name: ai_bias_audit_results_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_bias_audit_results_audit_id_seq OWNED BY public.ai_bias_audit_results.audit_id;


--
-- TOC entry 624 (class 1259 OID 22482)
-- Name: ai_budget_alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_budget_alerts (
    alert_id bigint NOT NULL,
    tenant_id bigint,
    alert_time timestamp with time zone DEFAULT now(),
    alert_type character varying(100),
    message text,
    severity character varying(20) DEFAULT 'info'::character varying,
    resolved boolean DEFAULT false,
    resolved_at timestamp with time zone
);


ALTER TABLE public.ai_budget_alerts OWNER TO postgres;

--
-- TOC entry 623 (class 1259 OID 22481)
-- Name: ai_budget_alerts_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_budget_alerts_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_budget_alerts_alert_id_seq OWNER TO postgres;

--
-- TOC entry 6242 (class 0 OID 0)
-- Dependencies: 623
-- Name: ai_budget_alerts_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_budget_alerts_alert_id_seq OWNED BY public.ai_budget_alerts.alert_id;


--
-- TOC entry 626 (class 1259 OID 22494)
-- Name: ai_budget_optimizer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_budget_optimizer (
    optimizer_id bigint NOT NULL,
    tenant_id bigint,
    period_start date DEFAULT (now())::date,
    period_end date DEFAULT ((now() + '7 days'::interval))::date,
    recommended_budget numeric(18,2),
    expected_revenue numeric(18,2),
    target_margin numeric(10,2),
    confidence numeric(5,2) DEFAULT 0.9,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_budget_optimizer OWNER TO postgres;

--
-- TOC entry 625 (class 1259 OID 22493)
-- Name: ai_budget_optimizer_optimizer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_budget_optimizer_optimizer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_budget_optimizer_optimizer_id_seq OWNER TO postgres;

--
-- TOC entry 6243 (class 0 OID 0)
-- Dependencies: 625
-- Name: ai_budget_optimizer_optimizer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_budget_optimizer_optimizer_id_seq OWNED BY public.ai_budget_optimizer.optimizer_id;


--
-- TOC entry 604 (class 1259 OID 22257)
-- Name: ai_campaign_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_campaign_metrics (
    campaign_id bigint NOT NULL,
    total_sent bigint DEFAULT 0,
    total_interacted bigint DEFAULT 0,
    conversion_rate numeric(5,2) DEFAULT 0,
    roi numeric(10,2) DEFAULT 0,
    last_updated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_campaign_metrics OWNER TO postgres;

--
-- TOC entry 479 (class 1259 OID 21274)
-- Name: ai_campaign_outcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_campaign_outcomes (
    outcome_id bigint NOT NULL,
    action_id bigint,
    user_id bigint,
    tenant_id bigint,
    converted boolean DEFAULT false,
    revenue_after numeric(14,2) DEFAULT 0,
    observed_at timestamp with time zone DEFAULT now(),
    attribution_window_days integer DEFAULT 30
);


ALTER TABLE public.ai_campaign_outcomes OWNER TO postgres;

--
-- TOC entry 478 (class 1259 OID 21273)
-- Name: ai_campaign_outcomes_outcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_campaign_outcomes_outcome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_campaign_outcomes_outcome_id_seq OWNER TO postgres;

--
-- TOC entry 6244 (class 0 OID 0)
-- Dependencies: 478
-- Name: ai_campaign_outcomes_outcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_campaign_outcomes_outcome_id_seq OWNED BY public.ai_campaign_outcomes.outcome_id;


--
-- TOC entry 603 (class 1259 OID 22241)
-- Name: ai_campaign_targets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_campaign_targets (
    campaign_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying,
    sent_at timestamp with time zone,
    interacted_at timestamp with time zone
);


ALTER TABLE public.ai_campaign_targets OWNER TO postgres;

--
-- TOC entry 602 (class 1259 OID 22225)
-- Name: ai_campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_campaigns (
    campaign_id bigint NOT NULL,
    campaign_name character varying(200),
    segment_id bigint,
    channel character varying(50),
    message_template text,
    status character varying(50) DEFAULT 'draft'::character varying,
    created_at timestamp with time zone DEFAULT now(),
    launched_at timestamp with time zone,
    CONSTRAINT ai_campaigns_channel_check CHECK (((channel)::text = ANY ((ARRAY['email'::character varying, 'sms'::character varying, 'push'::character varying, 'inapp'::character varying])::text[])))
);


ALTER TABLE public.ai_campaigns OWNER TO postgres;

--
-- TOC entry 601 (class 1259 OID 22224)
-- Name: ai_campaigns_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_campaigns_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_campaigns_campaign_id_seq OWNER TO postgres;

--
-- TOC entry 6245 (class 0 OID 0)
-- Dependencies: 601
-- Name: ai_campaigns_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_campaigns_campaign_id_seq OWNED BY public.ai_campaigns.campaign_id;


--
-- TOC entry 482 (class 1259 OID 21306)
-- Name: ai_churn_feature_weights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_churn_feature_weights (
    model_name character varying(100) NOT NULL,
    w_recency numeric(6,4) DEFAULT 0.4000,
    w_frequency numeric(6,4) DEFAULT 0.3000,
    w_monetary numeric(6,4) DEFAULT 0.3000,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_churn_feature_weights OWNER TO postgres;

--
-- TOC entry 474 (class 1259 OID 21249)
-- Name: ai_churn_model_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_churn_model_metrics (
    metric_id bigint NOT NULL,
    model_name character varying(100) DEFAULT 'rfm_churn_v1'::character varying,
    window_days integer DEFAULT 90,
    accuracy numeric(6,3),
    "precision" numeric(6,3),
    recall numeric(6,3),
    f1_score numeric(6,3),
    evaluated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_churn_model_metrics OWNER TO postgres;

--
-- TOC entry 473 (class 1259 OID 21248)
-- Name: ai_churn_model_metrics_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_churn_model_metrics_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_churn_model_metrics_metric_id_seq OWNER TO postgres;

--
-- TOC entry 6246 (class 0 OID 0)
-- Dependencies: 473
-- Name: ai_churn_model_metrics_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_churn_model_metrics_metric_id_seq OWNED BY public.ai_churn_model_metrics.metric_id;


--
-- TOC entry 470 (class 1259 OID 21216)
-- Name: ai_churn_predictions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_churn_predictions (
    churn_id bigint NOT NULL,
    user_id bigint,
    tenant_id bigint,
    churn_probability numeric(5,4),
    churn_risk character varying(20),
    last_activity timestamp with time zone,
    recency_days integer,
    frequency_30d numeric(10,2),
    monetary_90d numeric(12,2),
    reason text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_churn_predictions OWNER TO postgres;

--
-- TOC entry 469 (class 1259 OID 21215)
-- Name: ai_churn_predictions_churn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_churn_predictions_churn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_churn_predictions_churn_id_seq OWNER TO postgres;

--
-- TOC entry 6247 (class 0 OID 0)
-- Dependencies: 469
-- Name: ai_churn_predictions_churn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_churn_predictions_churn_id_seq OWNED BY public.ai_churn_predictions.churn_id;


--
-- TOC entry 543 (class 1259 OID 21744)
-- Name: ai_competitor_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_competitor_prices (
    competitor_id bigint NOT NULL,
    competitor_name character varying(200),
    product_sku character varying(100),
    competitor_price numeric(12,2),
    our_price numeric(12,2),
    price_gap numeric(12,2) GENERATED ALWAYS AS ((our_price - competitor_price)) STORED,
    collected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_competitor_prices OWNER TO postgres;

--
-- TOC entry 542 (class 1259 OID 21743)
-- Name: ai_competitor_prices_competitor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_competitor_prices_competitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_competitor_prices_competitor_id_seq OWNER TO postgres;

--
-- TOC entry 6248 (class 0 OID 0)
-- Dependencies: 542
-- Name: ai_competitor_prices_competitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_competitor_prices_competitor_id_seq OWNED BY public.ai_competitor_prices.competitor_id;


--
-- TOC entry 496 (class 1259 OID 21392)
-- Name: ai_compliance_alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_compliance_alerts (
    alert_id bigint NOT NULL,
    tenant_id bigint,
    alert_type character varying(100),
    severity character varying(20) DEFAULT 'medium'::character varying,
    description text,
    detected_at timestamp with time zone DEFAULT now(),
    resolved boolean DEFAULT false,
    resolved_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.ai_compliance_alerts OWNER TO postgres;

--
-- TOC entry 495 (class 1259 OID 21391)
-- Name: ai_compliance_alerts_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_compliance_alerts_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_compliance_alerts_alert_id_seq OWNER TO postgres;

--
-- TOC entry 6249 (class 0 OID 0)
-- Dependencies: 495
-- Name: ai_compliance_alerts_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_compliance_alerts_alert_id_seq OWNED BY public.ai_compliance_alerts.alert_id;


--
-- TOC entry 619 (class 1259 OID 22451)
-- Name: ai_cost_forecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_cost_forecasts (
    forecast_id bigint NOT NULL,
    tenant_id bigint DEFAULT 1,
    forecast_date date DEFAULT (now())::date,
    infra_cost numeric(18,2) DEFAULT 0,
    ai_cost numeric(18,2) DEFAULT 0,
    revenue numeric(18,2) DEFAULT 0,
    margin numeric(10,2) GENERATED ALWAYS AS ((revenue - (infra_cost + ai_cost))) STORED,
    confidence numeric(5,2) DEFAULT 0.90,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_cost_forecasts OWNER TO postgres;

--
-- TOC entry 618 (class 1259 OID 22450)
-- Name: ai_cost_forecasts_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_cost_forecasts_forecast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_cost_forecasts_forecast_id_seq OWNER TO postgres;

--
-- TOC entry 6250 (class 0 OID 0)
-- Dependencies: 618
-- Name: ai_cost_forecasts_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_cost_forecasts_forecast_id_seq OWNED BY public.ai_cost_forecasts.forecast_id;


--
-- TOC entry 467 (class 1259 OID 21195)
-- Name: ai_customer_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_customer_profiles (
    profile_id bigint NOT NULL,
    user_id bigint,
    tenant_id bigint,
    total_orders integer DEFAULT 0,
    total_spent numeric(18,2) DEFAULT 0,
    avg_order_value numeric(12,2) DEFAULT 0,
    first_order_at timestamp with time zone,
    last_order_at timestamp with time zone,
    days_since_last integer,
    order_frequency numeric(8,3),
    lifetime_value numeric(18,2),
    activity_score numeric(10,4),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_customer_profiles OWNER TO postgres;

--
-- TOC entry 466 (class 1259 OID 21194)
-- Name: ai_customer_profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_customer_profiles_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_customer_profiles_profile_id_seq OWNER TO postgres;

--
-- TOC entry 6251 (class 0 OID 0)
-- Dependencies: 466
-- Name: ai_customer_profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_customer_profiles_profile_id_seq OWNED BY public.ai_customer_profiles.profile_id;


--
-- TOC entry 521 (class 1259 OID 21590)
-- Name: ai_decision_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_decision_events (
    decision_id bigint NOT NULL,
    tenant_id bigint,
    policy_id bigint,
    action_type character varying(50),
    reference_id bigint,
    decision_reason text,
    confidence numeric(5,2),
    expected_reward numeric(10,4),
    actual_reward numeric(10,4),
    executed boolean DEFAULT false,
    executed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_decision_events OWNER TO postgres;

--
-- TOC entry 520 (class 1259 OID 21589)
-- Name: ai_decision_events_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_decision_events_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_decision_events_decision_id_seq OWNER TO postgres;

--
-- TOC entry 6252 (class 0 OID 0)
-- Dependencies: 520
-- Name: ai_decision_events_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_decision_events_decision_id_seq OWNED BY public.ai_decision_events.decision_id;


--
-- TOC entry 523 (class 1259 OID 21606)
-- Name: ai_decision_outcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_decision_outcomes (
    outcome_id bigint NOT NULL,
    decision_id bigint,
    metric_name character varying(100),
    metric_before numeric(14,4),
    metric_after numeric(14,4),
    impact_value numeric(14,4),
    measured_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_decision_outcomes OWNER TO postgres;

--
-- TOC entry 522 (class 1259 OID 21605)
-- Name: ai_decision_outcomes_outcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_decision_outcomes_outcome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_decision_outcomes_outcome_id_seq OWNER TO postgres;

--
-- TOC entry 6253 (class 0 OID 0)
-- Dependencies: 522
-- Name: ai_decision_outcomes_outcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_decision_outcomes_outcome_id_seq OWNED BY public.ai_decision_outcomes.outcome_id;


--
-- TOC entry 519 (class 1259 OID 21577)
-- Name: ai_decision_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_decision_policies (
    policy_id bigint NOT NULL,
    tenant_id bigint,
    policy_name character varying(200) NOT NULL,
    policy_type character varying(50),
    rule_definition jsonb,
    priority_level integer DEFAULT 1,
    threshold_value numeric(10,4),
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_decision_policies OWNER TO postgres;

--
-- TOC entry 518 (class 1259 OID 21576)
-- Name: ai_decision_policies_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_decision_policies_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_decision_policies_policy_id_seq OWNER TO postgres;

--
-- TOC entry 6254 (class 0 OID 0)
-- Dependencies: 518
-- Name: ai_decision_policies_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_decision_policies_policy_id_seq OWNED BY public.ai_decision_policies.policy_id;


--
-- TOC entry 571 (class 1259 OID 21922)
-- Name: ai_explainability_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_explainability_logs (
    log_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    decision_id bigint,
    reference_id bigint,
    confidence numeric(5,2),
    explanation jsonb,
    feature_importance jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_explainability_logs OWNER TO postgres;

--
-- TOC entry 570 (class 1259 OID 21921)
-- Name: ai_explainability_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_explainability_logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_explainability_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 6255 (class 0 OID 0)
-- Dependencies: 570
-- Name: ai_explainability_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_explainability_logs_log_id_seq OWNED BY public.ai_explainability_logs.log_id;


--
-- TOC entry 575 (class 1259 OID 21949)
-- Name: ai_fairness_scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_fairness_scores (
    score_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    parity_ratio numeric(8,4),
    opportunity_ratio numeric(8,4),
    overall_fairness numeric(8,4),
    window_start timestamp with time zone,
    window_end timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_fairness_scores OWNER TO postgres;

--
-- TOC entry 574 (class 1259 OID 21948)
-- Name: ai_fairness_scores_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_fairness_scores_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_fairness_scores_score_id_seq OWNER TO postgres;

--
-- TOC entry 6256 (class 0 OID 0)
-- Dependencies: 574
-- Name: ai_fairness_scores_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_fairness_scores_score_id_seq OWNED BY public.ai_fairness_scores.score_id;


--
-- TOC entry 565 (class 1259 OID 21878)
-- Name: ai_federated_rounds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_federated_rounds (
    round_id bigint NOT NULL,
    global_model_id bigint,
    start_time timestamp with time zone DEFAULT now(),
    end_time timestamp with time zone,
    participant_count integer,
    aggregated_accuracy numeric(10,4),
    aggregated_loss numeric(10,4),
    status character varying(50) DEFAULT 'running'::character varying,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_federated_rounds OWNER TO postgres;

--
-- TOC entry 564 (class 1259 OID 21877)
-- Name: ai_federated_rounds_round_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_federated_rounds_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_federated_rounds_round_id_seq OWNER TO postgres;

--
-- TOC entry 6257 (class 0 OID 0)
-- Dependencies: 564
-- Name: ai_federated_rounds_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_federated_rounds_round_id_seq OWNED BY public.ai_federated_rounds.round_id;


--
-- TOC entry 567 (class 1259 OID 21893)
-- Name: ai_federated_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_federated_updates (
    update_id bigint NOT NULL,
    round_id bigint,
    tenant_id bigint,
    local_accuracy numeric(10,4),
    local_loss numeric(10,4),
    weight_delta jsonb,
    submitted_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_federated_updates OWNER TO postgres;

--
-- TOC entry 566 (class 1259 OID 21892)
-- Name: ai_federated_updates_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_federated_updates_update_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_federated_updates_update_id_seq OWNER TO postgres;

--
-- TOC entry 6258 (class 0 OID 0)
-- Dependencies: 566
-- Name: ai_federated_updates_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_federated_updates_update_id_seq OWNED BY public.ai_federated_updates.update_id;


--
-- TOC entry 649 (class 1259 OID 22689)
-- Name: ai_global_decisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_global_decisions (
    decision_id bigint NOT NULL,
    decided_at timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1,
    component character varying(100),
    decision character varying(50),
    reason text,
    details jsonb,
    confidence numeric(5,2) DEFAULT 0.9,
    executed boolean DEFAULT false,
    executed_at timestamp with time zone
);


ALTER TABLE public.ai_global_decisions OWNER TO postgres;

--
-- TOC entry 648 (class 1259 OID 22688)
-- Name: ai_global_decisions_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_global_decisions_decision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_global_decisions_decision_id_seq OWNER TO postgres;

--
-- TOC entry 6259 (class 0 OID 0)
-- Dependencies: 648
-- Name: ai_global_decisions_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_global_decisions_decision_id_seq OWNED BY public.ai_global_decisions.decision_id;


--
-- TOC entry 563 (class 1259 OID 21867)
-- Name: ai_global_model_registry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_global_model_registry (
    model_id bigint NOT NULL,
    model_name character varying(200) NOT NULL,
    version_no integer DEFAULT 1,
    parameters jsonb,
    accuracy numeric(10,4),
    loss numeric(10,4),
    aggregated_from integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_global_model_registry OWNER TO postgres;

--
-- TOC entry 562 (class 1259 OID 21866)
-- Name: ai_global_model_registry_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_global_model_registry_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_global_model_registry_model_id_seq OWNER TO postgres;

--
-- TOC entry 6260 (class 0 OID 0)
-- Dependencies: 562
-- Name: ai_global_model_registry_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_global_model_registry_model_id_seq OWNED BY public.ai_global_model_registry.model_id;


--
-- TOC entry 458 (class 1259 OID 21084)
-- Name: ai_insight_trends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_insight_trends (
    trend_id bigint NOT NULL,
    snapshot_date date NOT NULL,
    tenant_id bigint,
    entity_type character varying(50) NOT NULL,
    entity_id bigint NOT NULL,
    trend_score numeric(10,4),
    momentum numeric(10,4),
    demand_level character varying(20),
    forecast_gap numeric(10,4),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_insight_trends OWNER TO postgres;

--
-- TOC entry 457 (class 1259 OID 21083)
-- Name: ai_insight_trends_trend_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_insight_trends_trend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_insight_trends_trend_id_seq OWNER TO postgres;

--
-- TOC entry 6261 (class 0 OID 0)
-- Dependencies: 457
-- Name: ai_insight_trends_trend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_insight_trends_trend_id_seq OWNED BY public.ai_insight_trends.trend_id;


--
-- TOC entry 507 (class 1259 OID 21507)
-- Name: ai_inventory_forecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_inventory_forecasts (
    inv_forecast_id bigint NOT NULL,
    product_id bigint,
    tenant_id bigint,
    forecast_date date DEFAULT CURRENT_DATE,
    current_stock integer,
    predicted_stock integer,
    daily_sales_rate numeric(10,2),
    days_to_stockout integer,
    reorder_recommendation boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_inventory_forecasts OWNER TO postgres;

--
-- TOC entry 506 (class 1259 OID 21506)
-- Name: ai_inventory_forecasts_inv_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_inventory_forecasts_inv_forecast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_inventory_forecasts_inv_forecast_id_seq OWNER TO postgres;

--
-- TOC entry 6262 (class 0 OID 0)
-- Dependencies: 506
-- Name: ai_inventory_forecasts_inv_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_inventory_forecasts_inv_forecast_id_seq OWNED BY public.ai_inventory_forecasts.inv_forecast_id;


--
-- TOC entry 484 (class 1259 OID 21316)
-- Name: ai_learning_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_learning_events (
    event_id bigint NOT NULL,
    model_name character varying(100),
    notes text,
    details jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_learning_events OWNER TO postgres;

--
-- TOC entry 483 (class 1259 OID 21315)
-- Name: ai_learning_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_learning_events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_learning_events_event_id_seq OWNER TO postgres;

--
-- TOC entry 6263 (class 0 OID 0)
-- Dependencies: 483
-- Name: ai_learning_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_learning_events_event_id_seq OWNED BY public.ai_learning_events.event_id;


--
-- TOC entry 537 (class 1259 OID 21709)
-- Name: ai_market_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_market_sources (
    source_id bigint NOT NULL,
    source_name character varying(200) NOT NULL,
    source_type character varying(50),
    data_format character varying(50),
    update_frequency character varying(50) DEFAULT 'daily'::character varying,
    endpoint_url text,
    active boolean DEFAULT true,
    last_fetched_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_market_sources OWNER TO postgres;

--
-- TOC entry 536 (class 1259 OID 21708)
-- Name: ai_market_sources_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_market_sources_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_market_sources_source_id_seq OWNER TO postgres;

--
-- TOC entry 6264 (class 0 OID 0)
-- Dependencies: 536
-- Name: ai_market_sources_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_market_sources_source_id_seq OWNED BY public.ai_market_sources.source_id;


--
-- TOC entry 539 (class 1259 OID 21721)
-- Name: ai_market_trends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_market_trends (
    trend_id bigint NOT NULL,
    source_id bigint,
    category character varying(100),
    indicator_name character varying(200),
    indicator_value numeric(18,4),
    indicator_change numeric(10,4),
    region character varying(100),
    collected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_market_trends OWNER TO postgres;

--
-- TOC entry 538 (class 1259 OID 21720)
-- Name: ai_market_trends_trend_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_market_trends_trend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_market_trends_trend_id_seq OWNER TO postgres;

--
-- TOC entry 6265 (class 0 OID 0)
-- Dependencies: 538
-- Name: ai_market_trends_trend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_market_trends_trend_id_seq OWNED BY public.ai_market_trends.trend_id;


--
-- TOC entry 462 (class 1259 OID 21112)
-- Name: ai_marketing_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_marketing_insights (
    insight_id bigint NOT NULL,
    snapshot_date date NOT NULL,
    tenant_id bigint,
    category_id bigint,
    insight_type character varying(100),
    description text,
    impact_score numeric(8,3),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_marketing_insights OWNER TO postgres;

--
-- TOC entry 461 (class 1259 OID 21111)
-- Name: ai_marketing_insights_insight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_marketing_insights_insight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_marketing_insights_insight_id_seq OWNER TO postgres;

--
-- TOC entry 6266 (class 0 OID 0)
-- Dependencies: 461
-- Name: ai_marketing_insights_insight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_marketing_insights_insight_id_seq OWNED BY public.ai_marketing_insights.insight_id;


--
-- TOC entry 600 (class 1259 OID 22213)
-- Name: ai_marketing_segments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_marketing_segments (
    segment_id bigint NOT NULL,
    segment_name character varying(200),
    criteria jsonb,
    last_refreshed timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_marketing_segments OWNER TO postgres;

--
-- TOC entry 599 (class 1259 OID 22212)
-- Name: ai_marketing_segments_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_marketing_segments_segment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_marketing_segments_segment_id_seq OWNER TO postgres;

--
-- TOC entry 6267 (class 0 OID 0)
-- Dependencies: 599
-- Name: ai_marketing_segments_segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_marketing_segments_segment_id_seq OWNED BY public.ai_marketing_segments.segment_id;


--
-- TOC entry 515 (class 1259 OID 21555)
-- Name: ai_model_performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_model_performance (
    perf_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    period_start date DEFAULT (CURRENT_DATE - '7 days'::interval),
    period_end date DEFAULT CURRENT_DATE,
    avg_reward numeric(10,4),
    avg_accuracy numeric(10,4),
    samples integer,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_model_performance OWNER TO postgres;

--
-- TOC entry 514 (class 1259 OID 21554)
-- Name: ai_model_performance_perf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_model_performance_perf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_model_performance_perf_id_seq OWNER TO postgres;

--
-- TOC entry 6268 (class 0 OID 0)
-- Dependencies: 514
-- Name: ai_model_performance_perf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_model_performance_perf_id_seq OWNED BY public.ai_model_performance.perf_id;


--
-- TOC entry 498 (class 1259 OID 21405)
-- Name: ai_policy_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_policy_rules (
    rule_id bigint NOT NULL,
    tenant_id bigint,
    rule_name character varying(200),
    rule_type character varying(50),
    rule_definition jsonb,
    last_evaluated timestamp with time zone DEFAULT now(),
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_policy_rules OWNER TO postgres;

--
-- TOC entry 497 (class 1259 OID 21404)
-- Name: ai_policy_rules_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_policy_rules_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_policy_rules_rule_id_seq OWNER TO postgres;

--
-- TOC entry 6269 (class 0 OID 0)
-- Dependencies: 497
-- Name: ai_policy_rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_policy_rules_rule_id_seq OWNED BY public.ai_policy_rules.rule_id;


--
-- TOC entry 505 (class 1259 OID 21492)
-- Name: ai_price_forecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_price_forecasts (
    forecast_id bigint NOT NULL,
    product_id bigint,
    tenant_id bigint,
    forecast_date date DEFAULT CURRENT_DATE,
    current_price numeric(12,2),
    optimal_price numeric(12,2),
    expected_demand numeric(14,2),
    expected_revenue numeric(14,2),
    elasticity_score numeric(6,3),
    confidence numeric(5,2) DEFAULT 90.00,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_price_forecasts OWNER TO postgres;

--
-- TOC entry 504 (class 1259 OID 21491)
-- Name: ai_price_forecasts_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_price_forecasts_forecast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_price_forecasts_forecast_id_seq OWNER TO postgres;

--
-- TOC entry 6270 (class 0 OID 0)
-- Dependencies: 504
-- Name: ai_price_forecasts_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_price_forecasts_forecast_id_seq OWNED BY public.ai_price_forecasts.forecast_id;


--
-- TOC entry 621 (class 1259 OID 22466)
-- Name: ai_profitability_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_profitability_insights (
    insight_id bigint NOT NULL,
    tenant_id bigint,
    avg_revenue numeric(18,2),
    avg_cost numeric(18,2),
    profit_margin numeric(10,2),
    efficiency_score numeric(5,2),
    detected_anomaly boolean DEFAULT false,
    detected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_profitability_insights OWNER TO postgres;

--
-- TOC entry 620 (class 1259 OID 22465)
-- Name: ai_profitability_insights_insight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_profitability_insights_insight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_profitability_insights_insight_id_seq OWNER TO postgres;

--
-- TOC entry 6271 (class 0 OID 0)
-- Dependencies: 620
-- Name: ai_profitability_insights_insight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_profitability_insights_insight_id_seq OWNED BY public.ai_profitability_insights.insight_id;


--
-- TOC entry 460 (class 1259 OID 21093)
-- Name: ai_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_recommendations (
    rec_id bigint NOT NULL,
    tenant_id bigint,
    base_product_id bigint,
    recommended_product_id bigint,
    reason character varying(200),
    confidence numeric(6,3),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_recommendations OWNER TO postgres;

--
-- TOC entry 459 (class 1259 OID 21092)
-- Name: ai_recommendations_rec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_recommendations_rec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_recommendations_rec_id_seq OWNER TO postgres;

--
-- TOC entry 6272 (class 0 OID 0)
-- Dependencies: 459
-- Name: ai_recommendations_rec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_recommendations_rec_id_seq OWNED BY public.ai_recommendations.rec_id;


--
-- TOC entry 616 (class 1259 OID 22431)
-- Name: ai_resource_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_resource_actions (
    action_id bigint NOT NULL,
    action_time timestamp with time zone DEFAULT now(),
    action_type character varying(100),
    target_component character varying(100),
    decision_reason text,
    expected_impact text,
    confidence numeric(5,2),
    executed boolean DEFAULT false,
    executed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_resource_actions OWNER TO postgres;

--
-- TOC entry 615 (class 1259 OID 22430)
-- Name: ai_resource_actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_resource_actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_resource_actions_action_id_seq OWNER TO postgres;

--
-- TOC entry 6273 (class 0 OID 0)
-- Dependencies: 615
-- Name: ai_resource_actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_resource_actions_action_id_seq OWNED BY public.ai_resource_actions.action_id;


--
-- TOC entry 472 (class 1259 OID 21232)
-- Name: ai_retention_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_retention_actions (
    action_id bigint NOT NULL,
    user_id bigint,
    tenant_id bigint,
    action_type character varying(100),
    description text,
    priority character varying(20),
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp with time zone DEFAULT now(),
    completed_at timestamp with time zone
);


ALTER TABLE public.ai_retention_actions OWNER TO postgres;

--
-- TOC entry 471 (class 1259 OID 21231)
-- Name: ai_retention_actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_retention_actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_retention_actions_action_id_seq OWNER TO postgres;

--
-- TOC entry 6274 (class 0 OID 0)
-- Dependencies: 471
-- Name: ai_retention_actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_retention_actions_action_id_seq OWNED BY public.ai_retention_actions.action_id;


--
-- TOC entry 631 (class 1259 OID 22526)
-- Name: ai_revenue_protection_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_revenue_protection_actions (
    action_id bigint NOT NULL,
    tenant_id bigint,
    action_time timestamp with time zone DEFAULT now(),
    action_type character varying(100),
    decision_reason text,
    expected_impact text,
    executed boolean DEFAULT false,
    executed_at timestamp with time zone
);


ALTER TABLE public.ai_revenue_protection_actions OWNER TO postgres;

--
-- TOC entry 630 (class 1259 OID 22525)
-- Name: ai_revenue_protection_actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_revenue_protection_actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_revenue_protection_actions_action_id_seq OWNER TO postgres;

--
-- TOC entry 6275 (class 0 OID 0)
-- Dependencies: 630
-- Name: ai_revenue_protection_actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_revenue_protection_actions_action_id_seq OWNED BY public.ai_revenue_protection_actions.action_id;


--
-- TOC entry 511 (class 1259 OID 21533)
-- Name: ai_rl_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_rl_feedback (
    feedback_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    reference_id bigint,
    forecast_date date,
    predicted_value numeric(14,2),
    actual_value numeric(14,2),
    reward_score numeric(10,4),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_rl_feedback OWNER TO postgres;

--
-- TOC entry 510 (class 1259 OID 21532)
-- Name: ai_rl_feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_rl_feedback_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_rl_feedback_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 6276 (class 0 OID 0)
-- Dependencies: 510
-- Name: ai_rl_feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_rl_feedback_feedback_id_seq OWNED BY public.ai_rl_feedback.feedback_id;


--
-- TOC entry 513 (class 1259 OID 21542)
-- Name: ai_rl_policy_weights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_rl_policy_weights (
    policy_id bigint NOT NULL,
    tenant_id bigint,
    model_type character varying(50),
    weight_demand numeric(10,6) DEFAULT 1.0,
    weight_margin numeric(10,6) DEFAULT 1.0,
    weight_accuracy numeric(10,6) DEFAULT 1.0,
    learning_rate numeric(5,4) DEFAULT 0.05,
    last_updated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_rl_policy_weights OWNER TO postgres;

--
-- TOC entry 512 (class 1259 OID 21541)
-- Name: ai_rl_policy_weights_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_rl_policy_weights_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_rl_policy_weights_policy_id_seq OWNER TO postgres;

--
-- TOC entry 6277 (class 0 OID 0)
-- Dependencies: 512
-- Name: ai_rl_policy_weights_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_rl_policy_weights_policy_id_seq OWNED BY public.ai_rl_policy_weights.policy_id;


--
-- TOC entry 614 (class 1259 OID 22421)
-- Name: ai_scaling_predictions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_scaling_predictions (
    prediction_id bigint NOT NULL,
    forecast_time timestamp with time zone DEFAULT now(),
    period_minutes integer DEFAULT 60,
    predicted_orders bigint,
    predicted_revenue numeric(18,2),
    predicted_cpu_load numeric(10,2),
    predicted_memory_gb numeric(10,2),
    confidence numeric(5,2),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_scaling_predictions OWNER TO postgres;

--
-- TOC entry 613 (class 1259 OID 22420)
-- Name: ai_scaling_predictions_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_scaling_predictions_prediction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_scaling_predictions_prediction_id_seq OWNER TO postgres;

--
-- TOC entry 6278 (class 0 OID 0)
-- Dependencies: 613
-- Name: ai_scaling_predictions_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_scaling_predictions_prediction_id_seq OWNED BY public.ai_scaling_predictions.prediction_id;


--
-- TOC entry 547 (class 1259 OID 21765)
-- Name: ai_scenario_library; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_scenario_library (
    scenario_id bigint NOT NULL,
    scenario_name character varying(200) NOT NULL,
    scenario_type character varying(100),
    assumptions jsonb,
    description text,
    created_by character varying(100),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_scenario_library OWNER TO postgres;

--
-- TOC entry 546 (class 1259 OID 21764)
-- Name: ai_scenario_library_scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_scenario_library_scenario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_scenario_library_scenario_id_seq OWNER TO postgres;

--
-- TOC entry 6279 (class 0 OID 0)
-- Dependencies: 546
-- Name: ai_scenario_library_scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_scenario_library_scenario_id_seq OWNED BY public.ai_scenario_library.scenario_id;


--
-- TOC entry 541 (class 1259 OID 21734)
-- Name: ai_sentiment_signals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_sentiment_signals (
    sentiment_id bigint NOT NULL,
    brand_name character varying(200),
    product_keyword character varying(200),
    polarity_score numeric(6,3),
    intensity_score numeric(6,3),
    sample_volume integer,
    region character varying(100),
    collected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_sentiment_signals OWNER TO postgres;

--
-- TOC entry 540 (class 1259 OID 21733)
-- Name: ai_sentiment_signals_sentiment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_sentiment_signals_sentiment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_sentiment_signals_sentiment_id_seq OWNER TO postgres;

--
-- TOC entry 6280 (class 0 OID 0)
-- Dependencies: 540
-- Name: ai_sentiment_signals_sentiment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_sentiment_signals_sentiment_id_seq OWNED BY public.ai_sentiment_signals.sentiment_id;


--
-- TOC entry 551 (class 1259 OID 21792)
-- Name: ai_simulation_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_simulation_results (
    result_id bigint NOT NULL,
    run_id bigint,
    kpi_name character varying(100),
    base_value numeric(18,4),
    simulated_value numeric(18,4),
    delta_value numeric(10,4) GENERATED ALWAYS AS ((simulated_value - base_value)) STORED,
    delta_percent numeric(10,4),
    confidence numeric(6,3),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_simulation_results OWNER TO postgres;

--
-- TOC entry 550 (class 1259 OID 21791)
-- Name: ai_simulation_results_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_simulation_results_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_simulation_results_result_id_seq OWNER TO postgres;

--
-- TOC entry 6281 (class 0 OID 0)
-- Dependencies: 550
-- Name: ai_simulation_results_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_simulation_results_result_id_seq OWNED BY public.ai_simulation_results.result_id;


--
-- TOC entry 549 (class 1259 OID 21775)
-- Name: ai_simulation_runs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_simulation_runs (
    run_id bigint NOT NULL,
    scenario_id bigint,
    tenant_id bigint,
    start_time timestamp with time zone DEFAULT now(),
    end_time timestamp with time zone,
    status character varying(50) DEFAULT 'running'::character varying,
    notes text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_simulation_runs OWNER TO postgres;

--
-- TOC entry 548 (class 1259 OID 21774)
-- Name: ai_simulation_runs_run_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_simulation_runs_run_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_simulation_runs_run_id_seq OWNER TO postgres;

--
-- TOC entry 6282 (class 0 OID 0)
-- Dependencies: 548
-- Name: ai_simulation_runs_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_simulation_runs_run_id_seq OWNED BY public.ai_simulation_runs.run_id;


--
-- TOC entry 500 (class 1259 OID 21417)
-- Name: ai_sla_monitoring; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_sla_monitoring (
    sla_id bigint NOT NULL,
    tenant_id bigint,
    job_name character varying(200),
    sla_target_ms bigint DEFAULT 1000,
    avg_latency_ms bigint DEFAULT 0,
    success_rate numeric(5,2) DEFAULT 100.00,
    total_runs integer DEFAULT 0,
    failures integer DEFAULT 0,
    window_start timestamp with time zone DEFAULT (now() - '1 day'::interval),
    window_end timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_sla_monitoring OWNER TO postgres;

--
-- TOC entry 499 (class 1259 OID 21416)
-- Name: ai_sla_monitoring_sla_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_sla_monitoring_sla_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_sla_monitoring_sla_id_seq OWNER TO postgres;

--
-- TOC entry 6283 (class 0 OID 0)
-- Dependencies: 499
-- Name: ai_sla_monitoring_sla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_sla_monitoring_sla_id_seq OWNED BY public.ai_sla_monitoring.sla_id;


--
-- TOC entry 557 (class 1259 OID 21832)
-- Name: ai_strategy_evolution_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_strategy_evolution_history (
    evolution_id bigint NOT NULL,
    tenant_id bigint,
    parent_strategy_id bigint,
    child_strategy_id bigint,
    mutation_factor numeric(6,3),
    improvement_pct numeric(6,3),
    notes text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_strategy_evolution_history OWNER TO postgres;

--
-- TOC entry 556 (class 1259 OID 21831)
-- Name: ai_strategy_evolution_history_evolution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_strategy_evolution_history_evolution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_strategy_evolution_history_evolution_id_seq OWNER TO postgres;

--
-- TOC entry 6284 (class 0 OID 0)
-- Dependencies: 556
-- Name: ai_strategy_evolution_history_evolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_strategy_evolution_history_evolution_id_seq OWNED BY public.ai_strategy_evolution_history.evolution_id;


--
-- TOC entry 559 (class 1259 OID 21842)
-- Name: ai_strategy_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_strategy_metrics (
    metric_id bigint NOT NULL,
    strategy_id bigint,
    metric_name character varying(100),
    metric_value numeric(18,4),
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_strategy_metrics OWNER TO postgres;

--
-- TOC entry 558 (class 1259 OID 21841)
-- Name: ai_strategy_metrics_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_strategy_metrics_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_strategy_metrics_metric_id_seq OWNER TO postgres;

--
-- TOC entry 6285 (class 0 OID 0)
-- Dependencies: 558
-- Name: ai_strategy_metrics_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_strategy_metrics_metric_id_seq OWNED BY public.ai_strategy_metrics.metric_id;


--
-- TOC entry 555 (class 1259 OID 21820)
-- Name: ai_strategy_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_strategy_versions (
    strategy_id bigint NOT NULL,
    tenant_id bigint,
    base_strategy_id bigint,
    generation_no integer DEFAULT 1,
    strategy_name character varying(200),
    parameters jsonb,
    performance_score numeric(10,4),
    reward_avg numeric(10,4),
    confidence_avg numeric(10,4),
    volatility numeric(10,4),
    is_active boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_strategy_versions OWNER TO postgres;

--
-- TOC entry 554 (class 1259 OID 21819)
-- Name: ai_strategy_versions_strategy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_strategy_versions_strategy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_strategy_versions_strategy_id_seq OWNER TO postgres;

--
-- TOC entry 6286 (class 0 OID 0)
-- Dependencies: 554
-- Name: ai_strategy_versions_strategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_strategy_versions_strategy_id_seq OWNED BY public.ai_strategy_versions.strategy_id;


--
-- TOC entry 481 (class 1259 OID 21296)
-- Name: ai_uplift_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_uplift_metrics (
    metric_id bigint NOT NULL,
    action_type character varying(100),
    churn_risk character varying(20),
    attempts integer,
    conversions integer,
    conversion_rate numeric(6,4),
    avg_revenue numeric(14,2),
    window_days integer DEFAULT 30,
    calculated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_uplift_metrics OWNER TO postgres;

--
-- TOC entry 480 (class 1259 OID 21295)
-- Name: ai_uplift_metrics_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_uplift_metrics_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_uplift_metrics_metric_id_seq OWNER TO postgres;

--
-- TOC entry 6287 (class 0 OID 0)
-- Dependencies: 480
-- Name: ai_uplift_metrics_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_uplift_metrics_metric_id_seq OWNED BY public.ai_uplift_metrics.metric_id;


--
-- TOC entry 593 (class 1259 OID 22113)
-- Name: ai_webhook_health; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_webhook_health (
    webhook_id bigint NOT NULL,
    success_rate numeric(5,2) DEFAULT 100.0,
    avg_latency_ms numeric(10,2) DEFAULT 0.0,
    confidence_score numeric(5,2) DEFAULT 1.0,
    last_evaluation timestamp with time zone DEFAULT now(),
    status text DEFAULT 'healthy'::text,
    consecutive_failures integer DEFAULT 0
);


ALTER TABLE public.ai_webhook_health OWNER TO postgres;

--
-- TOC entry 452 (class 1259 OID 21001)
-- Name: alert_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_queue (
    alert_id bigint NOT NULL,
    rule_id bigint,
    snapshot_date date,
    tenant_id bigint,
    kpi_name character varying(100),
    severity character varying(20),
    message text,
    payload jsonb,
    status character varying(20) DEFAULT 'pending'::character varying,
    attempts integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    sent_at timestamp with time zone
);


ALTER TABLE public.alert_queue OWNER TO postgres;

--
-- TOC entry 451 (class 1259 OID 21000)
-- Name: alert_queue_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_queue_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alert_queue_alert_id_seq OWNER TO postgres;

--
-- TOC entry 6288 (class 0 OID 0)
-- Dependencies: 451
-- Name: alert_queue_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_queue_alert_id_seq OWNED BY public.alert_queue.alert_id;


--
-- TOC entry 450 (class 1259 OID 20986)
-- Name: alert_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_rules (
    rule_id bigint NOT NULL,
    rule_name character varying(200) NOT NULL,
    tenant_id bigint,
    kpi_name character varying(100),
    severity_min character varying(20) DEFAULT 'warn'::character varying,
    channel character varying(50) DEFAULT 'webhook'::character varying,
    target_endpoint text,
    active boolean DEFAULT true,
    condition_json jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.alert_rules OWNER TO postgres;

--
-- TOC entry 449 (class 1259 OID 20985)
-- Name: alert_rules_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_rules_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alert_rules_rule_id_seq OWNER TO postgres;

--
-- TOC entry 6289 (class 0 OID 0)
-- Dependencies: 449
-- Name: alert_rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_rules_rule_id_seq OWNED BY public.alert_rules.rule_id;


--
-- TOC entry 309 (class 1259 OID 17158)
-- Name: analytics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics (
    analytics_id bigint NOT NULL,
    report_type text,
    metric_name text,
    metric_value numeric(18,4),
    report_date date,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.analytics OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 17157)
-- Name: analytics_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.analytics ALTER COLUMN analytics_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.analytics_analytics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 359 (class 1259 OID 17795)
-- Name: api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_keys (
    api_key_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    key_value character varying(255) NOT NULL,
    scopes jsonb,
    owner_id bigint,
    owner_type character varying(20) DEFAULT 'admin'::character varying,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.api_keys OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 17794)
-- Name: api_keys_api_key_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_keys_api_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_keys_api_key_id_seq OWNER TO postgres;

--
-- TOC entry 6290 (class 0 OID 0)
-- Dependencies: 358
-- Name: api_keys_api_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_keys_api_key_id_seq OWNED BY public.api_keys.api_key_id;


--
-- TOC entry 361 (class 1259 OID 17807)
-- Name: api_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_logs (
    api_log_id bigint NOT NULL,
    api_key_id bigint,
    path character varying(1024),
    method character varying(10),
    request_body jsonb,
    response_code integer,
    response_body jsonb,
    ip_address character varying(45),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.api_logs OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 17806)
-- Name: api_logs_api_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_logs_api_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_logs_api_log_id_seq OWNER TO postgres;

--
-- TOC entry 6291 (class 0 OID 0)
-- Dependencies: 360
-- Name: api_logs_api_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_logs_api_log_id_seq OWNED BY public.api_logs.api_log_id;


--
-- TOC entry 412 (class 1259 OID 19979)
-- Name: api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_tokens (
    token_id bigint NOT NULL,
    user_id bigint,
    token character varying(255) NOT NULL,
    scope character varying(255),
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    revoked boolean DEFAULT false
);


ALTER TABLE public.api_tokens OWNER TO postgres;

--
-- TOC entry 411 (class 1259 OID 19978)
-- Name: api_tokens_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_tokens_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_tokens_token_id_seq OWNER TO postgres;

--
-- TOC entry 6292 (class 0 OID 0)
-- Dependencies: 411
-- Name: api_tokens_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_tokens_token_id_seq OWNED BY public.api_tokens.token_id;


--
-- TOC entry 489 (class 1259 OID 21352)
-- Name: audit_access_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_access_logs (
    audit_id bigint NOT NULL,
    tenant_id bigint,
    user_id bigint,
    table_name character varying(200),
    access_type character varying(50),
    access_time timestamp with time zone DEFAULT now(),
    ip_address inet,
    metadata jsonb
);


ALTER TABLE public.audit_access_logs OWNER TO postgres;

--
-- TOC entry 488 (class 1259 OID 21351)
-- Name: audit_access_logs_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_access_logs_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_access_logs_audit_id_seq OWNER TO postgres;

--
-- TOC entry 6293 (class 0 OID 0)
-- Dependencies: 488
-- Name: audit_access_logs_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_access_logs_audit_id_seq OWNED BY public.audit_access_logs.audit_id;


--
-- TOC entry 313 (class 1259 OID 17194)
-- Name: audit_trail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_trail (
    audit_id bigint NOT NULL,
    table_name text,
    record_id bigint,
    action text,
    user_id bigint,
    old_data jsonb,
    new_data jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.audit_trail OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 17193)
-- Name: audit_trail_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.audit_trail ALTER COLUMN audit_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.audit_trail_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 337 (class 1259 OID 17673)
-- Name: campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaigns (
    campaign_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    scope character varying(20) DEFAULT 'global'::character varying,
    scope_payload jsonb,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.campaigns OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 17672)
-- Name: campaigns_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaigns_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campaigns_campaign_id_seq OWNER TO postgres;

--
-- TOC entry 6294 (class 0 OID 0)
-- Dependencies: 336
-- Name: campaigns_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaigns_campaign_id_seq OWNED BY public.campaigns.campaign_id;


--
-- TOC entry 233 (class 1259 OID 16434)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id bigint NOT NULL,
    parent_id integer,
    category_name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    type character varying(20) DEFAULT 'product'::character varying,
    icon character varying(50),
    image_url character varying(500),
    sort_order integer DEFAULT 0,
    level integer DEFAULT 1,
    is_featured boolean DEFAULT false,
    status character varying(20) DEFAULT 'active'::character varying,
    meta_title character varying(255),
    meta_description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16433)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 6295 (class 0 OID 0)
-- Dependencies: 232
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 291 (class 1259 OID 16966)
-- Name: chat_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_rooms (
    chat_room_id bigint NOT NULL,
    type text,
    related_order_id bigint,
    participants jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.chat_rooms OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 16965)
-- Name: chat_rooms_chat_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.chat_rooms ALTER COLUMN chat_room_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chat_rooms_chat_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 351 (class 1259 OID 17753)
-- Name: commission_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commission_rates (
    commission_id bigint NOT NULL,
    shop_id bigint,
    category_id bigint,
    rate_percent numeric(5,2) DEFAULT 0.00 NOT NULL,
    effective_from timestamp with time zone,
    effective_to timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.commission_rates OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 17752)
-- Name: commission_rates_commission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commission_rates_commission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commission_rates_commission_id_seq OWNER TO postgres;

--
-- TOC entry 6296 (class 0 OID 0)
-- Dependencies: 350
-- Name: commission_rates_commission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commission_rates_commission_id_seq OWNED BY public.commission_rates.commission_id;


--
-- TOC entry 335 (class 1259 OID 17664)
-- Name: coupon_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_usage (
    usage_id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    user_id bigint,
    order_id bigint,
    applied_amount numeric(15,2) DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.coupon_usage OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 17663)
-- Name: coupon_usage_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_usage_usage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_usage_usage_id_seq OWNER TO postgres;

--
-- TOC entry 6297 (class 0 OID 0)
-- Dependencies: 334
-- Name: coupon_usage_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_usage_usage_id_seq OWNED BY public.coupon_usage.usage_id;


--
-- TOC entry 305 (class 1259 OID 17127)
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    coupon_id bigint NOT NULL,
    code text NOT NULL,
    discount_type text NOT NULL,
    discount_value numeric(10,4) NOT NULL,
    min_purchase numeric(14,2),
    usage_limit bigint,
    used_count bigint DEFAULT 0,
    valid_from date,
    valid_to date,
    status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 17126)
-- Name: coupons_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.coupons ALTER COLUMN coupon_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.coupons_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 388 (class 1259 OID 19619)
-- Name: currency_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency_rates (
    currency_code character varying(10) NOT NULL,
    rate_to_usd numeric(18,8) NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.currency_rates OWNER TO postgres;

--
-- TOC entry 410 (class 1259 OID 19964)
-- Name: customer_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_metrics (
    user_id bigint NOT NULL,
    total_orders integer DEFAULT 0,
    total_spent numeric(18,2) DEFAULT 0,
    last_order_date timestamp with time zone,
    loyalty_tier character varying(50) DEFAULT 'Bronze'::character varying,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.customer_metrics OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 17828)
-- Name: data_backups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_backups (
    backup_id bigint NOT NULL,
    filename character varying(1024) NOT NULL,
    filesize bigint,
    storage_path character varying(1024),
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.data_backups OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 17827)
-- Name: data_backups_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_backups_backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_backups_backup_id_seq OWNER TO postgres;

--
-- TOC entry 6298 (class 0 OID 0)
-- Dependencies: 364
-- Name: data_backups_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_backups_backup_id_seq OWNED BY public.data_backups.backup_id;


--
-- TOC entry 491 (class 1259 OID 21363)
-- Name: data_retention_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_retention_jobs (
    job_id bigint NOT NULL,
    tenant_id bigint,
    table_name character varying(200),
    action_type character varying(50),
    affected_rows integer,
    executed_at timestamp with time zone DEFAULT now(),
    status character varying(20) DEFAULT 'success'::character varying,
    notes text
);


ALTER TABLE public.data_retention_jobs OWNER TO postgres;

--
-- TOC entry 490 (class 1259 OID 21362)
-- Name: data_retention_jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_retention_jobs_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_retention_jobs_job_id_seq OWNER TO postgres;

--
-- TOC entry 6299 (class 0 OID 0)
-- Dependencies: 490
-- Name: data_retention_jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_retention_jobs_job_id_seq OWNED BY public.data_retention_jobs.job_id;


--
-- TOC entry 285 (class 1259 OID 16903)
-- Name: deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliveries (
    delivery_id bigint NOT NULL,
    order_id bigint,
    user_id bigint,
    shop_id bigint,
    delivery_partner_id bigint,
    tracking_number text,
    pickup_address text,
    dropoff_address text,
    distance_km numeric(8,2),
    estimated_time_minutes integer,
    delivery_fee numeric(12,2),
    payment_status text DEFAULT 'pending'::text,
    delivery_status text DEFAULT 'pending'::text,
    delivery_date timestamp with time zone,
    admin_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.deliveries OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 16902)
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.deliveries ALTER COLUMN delivery_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.deliveries_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 295 (class 1259 OID 16994)
-- Name: delivery_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_feedback (
    feedback_id bigint NOT NULL,
    delivery_id bigint,
    user_id bigint,
    rating smallint,
    comment text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT delivery_feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.delivery_feedback OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 16993)
-- Name: delivery_feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.delivery_feedback ALTER COLUMN feedback_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.delivery_feedback_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 333 (class 1259 OID 17654)
-- Name: delivery_partner_payouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_partner_payouts (
    payout_id bigint NOT NULL,
    delivery_partner_id bigint NOT NULL,
    delivery_id bigint,
    amount numeric(15,2) NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    status character varying(20) DEFAULT 'pending'::character varying,
    transaction_ref character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.delivery_partner_payouts OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 17653)
-- Name: delivery_partner_payouts_payout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_partner_payouts_payout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_partner_payouts_payout_id_seq OWNER TO postgres;

--
-- TOC entry 6300 (class 0 OID 0)
-- Dependencies: 332
-- Name: delivery_partner_payouts_payout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_partner_payouts_payout_id_seq OWNED BY public.delivery_partner_payouts.payout_id;


--
-- TOC entry 355 (class 1259 OID 17773)
-- Name: delivery_partner_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_partner_wallets (
    wallet_id bigint NOT NULL,
    delivery_partner_id bigint NOT NULL,
    balance numeric(18,2) DEFAULT 0.00 NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.delivery_partner_wallets OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 17772)
-- Name: delivery_partner_wallets_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_partner_wallets_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_partner_wallets_wallet_id_seq OWNER TO postgres;

--
-- TOC entry 6301 (class 0 OID 0)
-- Dependencies: 354
-- Name: delivery_partner_wallets_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_partner_wallets_wallet_id_seq OWNED BY public.delivery_partner_wallets.wallet_id;


--
-- TOC entry 283 (class 1259 OID 16892)
-- Name: delivery_partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_partners (
    delivery_partner_id bigint NOT NULL,
    name text NOT NULL,
    contact_name text,
    contact_phone text,
    email text,
    vehicle_type text,
    area_coverage jsonb,
    rating numeric(3,2),
    status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.delivery_partners OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 16891)
-- Name: delivery_partners_delivery_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.delivery_partners ALTER COLUMN delivery_partner_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.delivery_partners_delivery_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 329 (class 1259 OID 17629)
-- Name: delivery_pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_pricing (
    pricing_id bigint NOT NULL,
    shop_id bigint,
    zone_id bigint,
    min_weight numeric(10,3) DEFAULT 0,
    max_weight numeric(10,3) DEFAULT 0,
    base_fee numeric(15,2) DEFAULT 0,
    per_km_fee numeric(15,2) DEFAULT 0,
    delivery_type character varying(20) DEFAULT 'standard'::character varying,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.delivery_pricing OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 17628)
-- Name: delivery_pricing_pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_pricing_pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_pricing_pricing_id_seq OWNER TO postgres;

--
-- TOC entry 6302 (class 0 OID 0)
-- Dependencies: 328
-- Name: delivery_pricing_pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_pricing_pricing_id_seq OWNED BY public.delivery_pricing.pricing_id;


--
-- TOC entry 287 (class 1259 OID 16940)
-- Name: delivery_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_tracking (
    tracking_id bigint NOT NULL,
    delivery_id bigint NOT NULL,
    status text,
    location text,
    latitude double precision,
    longitude double precision,
    note text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.delivery_tracking OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 16939)
-- Name: delivery_tracking_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.delivery_tracking ALTER COLUMN tracking_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.delivery_tracking_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 331 (class 1259 OID 17643)
-- Name: delivery_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_zones (
    zone_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    areas jsonb,
    country character varying(100),
    city character varying(100),
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.delivery_zones OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 17642)
-- Name: delivery_zones_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_zones_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delivery_zones_zone_id_seq OWNER TO postgres;

--
-- TOC entry 6303 (class 0 OID 0)
-- Dependencies: 330
-- Name: delivery_zones_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_zones_zone_id_seq OWNED BY public.delivery_zones.zone_id;


--
-- TOC entry 341 (class 1259 OID 17697)
-- Name: email_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_subscriptions (
    subscription_id bigint NOT NULL,
    email character varying(320) NOT NULL,
    user_id bigint,
    source character varying(100),
    status character varying(20) DEFAULT 'subscribed'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.email_subscriptions OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 17696)
-- Name: email_subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_subscriptions_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_subscriptions_subscription_id_seq OWNER TO postgres;

--
-- TOC entry 6304 (class 0 OID 0)
-- Dependencies: 340
-- Name: email_subscriptions_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_subscriptions_subscription_id_seq OWNED BY public.email_subscriptions.subscription_id;


--
-- TOC entry 392 (class 1259 OID 19643)
-- Name: event_queue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_queue (
    event_id bigint NOT NULL,
    event_type character varying(100) NOT NULL,
    payload jsonb,
    status character varying(50) DEFAULT 'pending'::character varying,
    retry_count integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    processed_at timestamp with time zone
);


ALTER TABLE public.event_queue OWNER TO postgres;

--
-- TOC entry 391 (class 1259 OID 19642)
-- Name: event_queue_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_queue_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_queue_event_id_seq OWNER TO postgres;

--
-- TOC entry 6305 (class 0 OID 0)
-- Dependencies: 391
-- Name: event_queue_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_queue_event_id_seq OWNED BY public.event_queue.event_id;


--
-- TOC entry 277 (class 1259 OID 16846)
-- Name: finance_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finance_management (
    record_id bigint NOT NULL,
    transaction_id text,
    admin_id bigint,
    type text,
    amount numeric(12,2),
    currency text,
    status text,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.finance_management OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 16845)
-- Name: finance_management_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.finance_management ALTER COLUMN record_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.finance_management_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 297 (class 1259 OID 17015)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    order_number text,
    user_id bigint,
    shop_id bigint,
    total_amount numeric(14,2),
    currency text,
    payment_status text DEFAULT 'pending'::text,
    order_status text DEFAULT 'pending'::text,
    delivery_id bigint,
    payment_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    promotion_id bigint,
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 17072)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id bigint NOT NULL,
    order_id bigint,
    user_id bigint,
    amount numeric(14,2),
    currency text,
    method text,
    transaction_ref text,
    status text DEFAULT 'pending'::text,
    paid_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 17100)
-- Name: refunds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refunds (
    refund_id bigint NOT NULL,
    order_id bigint,
    payment_id bigint,
    user_id bigint,
    reason text,
    amount numeric(14,2),
    status text DEFAULT 'pending'::text,
    created_at timestamp with time zone DEFAULT now(),
    currency character varying(10) DEFAULT 'USD'::character varying,
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.refunds OWNER TO postgres;

--
-- TOC entry 413 (class 1259 OID 19999)
-- Name: financial_summary; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.financial_summary AS
 SELECT (date_trunc('day'::text, COALESCE(p.paid_at, o.created_at)))::date AS report_date,
    count(DISTINCT o.order_id) AS total_orders,
    (COALESCE(sum(p.amount), (0)::numeric))::numeric(18,2) AS gross_revenue,
    (COALESCE(sum(rf.amount), (0)::numeric))::numeric(18,2) AS total_refunds,
    ((COALESCE(sum(p.amount), (0)::numeric) - COALESCE(sum(rf.amount), (0)::numeric)))::numeric(18,2) AS net_revenue
   FROM ((public.orders o
     LEFT JOIN public.payments p ON ((o.order_id = p.order_id)))
     LEFT JOIN public.refunds rf ON ((p.payment_id = rf.payment_id)))
  GROUP BY ((date_trunc('day'::text, COALESCE(p.paid_at, o.created_at)))::date)
  ORDER BY ((date_trunc('day'::text, COALESCE(p.paid_at, o.created_at)))::date) DESC
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.financial_summary OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 17817)
-- Name: gdpr_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gdpr_requests (
    request_id bigint NOT NULL,
    user_id bigint NOT NULL,
    request_type character varying(10) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    payload jsonb,
    processed_by bigint,
    processed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.gdpr_requests OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 17816)
-- Name: gdpr_requests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gdpr_requests_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gdpr_requests_request_id_seq OWNER TO postgres;

--
-- TOC entry 6306 (class 0 OID 0)
-- Dependencies: 362
-- Name: gdpr_requests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gdpr_requests_request_id_seq OWNED BY public.gdpr_requests.request_id;


--
-- TOC entry 369 (class 1259 OID 17847)
-- Name: gift_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gift_cards (
    gift_card_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    amount numeric(15,2) NOT NULL,
    balance numeric(15,2) NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    expires_at timestamp with time zone,
    status character varying(20) DEFAULT 'active'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.gift_cards OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 17846)
-- Name: gift_cards_gift_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gift_cards_gift_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gift_cards_gift_card_id_seq OWNER TO postgres;

--
-- TOC entry 6307 (class 0 OID 0)
-- Dependencies: 368
-- Name: gift_cards_gift_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gift_cards_gift_card_id_seq OWNED BY public.gift_cards.gift_card_id;


--
-- TOC entry 375 (class 1259 OID 17879)
-- Name: integration_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integration_webhooks (
    webhook_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(1024) NOT NULL,
    event character varying(255) NOT NULL,
    secret character varying(255),
    active boolean DEFAULT true,
    last_status character varying(255),
    last_called_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.integration_webhooks OWNER TO postgres;

--
-- TOC entry 374 (class 1259 OID 17878)
-- Name: integration_webhooks_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integration_webhooks_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.integration_webhooks_webhook_id_seq OWNER TO postgres;

--
-- TOC entry 6308 (class 0 OID 0)
-- Dependencies: 374
-- Name: integration_webhooks_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.integration_webhooks_webhook_id_seq OWNED BY public.integration_webhooks.webhook_id;


--
-- TOC entry 407 (class 1259 OID 19926)
-- Name: inventory_alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_alerts (
    alert_id bigint NOT NULL,
    product_id bigint,
    current_stock integer,
    threshold integer DEFAULT 10,
    created_at timestamp with time zone DEFAULT now(),
    resolved boolean DEFAULT false,
    resolved_at timestamp with time zone
);


ALTER TABLE public.inventory_alerts OWNER TO postgres;

--
-- TOC entry 406 (class 1259 OID 19925)
-- Name: inventory_alerts_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_alerts_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_alerts_alert_id_seq OWNER TO postgres;

--
-- TOC entry 6309 (class 0 OID 0)
-- Dependencies: 406
-- Name: inventory_alerts_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_alerts_alert_id_seq OWNED BY public.inventory_alerts.alert_id;


--
-- TOC entry 311 (class 1259 OID 17168)
-- Name: inventory_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_logs (
    log_id bigint NOT NULL,
    product_id bigint,
    variant_id bigint,
    action text,
    quantity integer,
    reason text,
    admin_id bigint,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.inventory_logs OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 17167)
-- Name: inventory_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.inventory_logs ALTER COLUMN log_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16390)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    title text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16389)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 6310 (class 0 OID 0)
-- Dependencies: 228
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 432 (class 1259 OID 20875)
-- Name: job_run_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_run_history (
    job_id bigint NOT NULL,
    job_name character varying(200) NOT NULL,
    started_at timestamp with time zone DEFAULT now(),
    finished_at timestamp with time zone,
    status character varying(50) DEFAULT 'running'::character varying,
    details jsonb
);


ALTER TABLE public.job_run_history OWNER TO postgres;

--
-- TOC entry 431 (class 1259 OID 20874)
-- Name: job_run_history_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_run_history_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_run_history_job_id_seq OWNER TO postgres;

--
-- TOC entry 6311 (class 0 OID 0)
-- Dependencies: 431
-- Name: job_run_history_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_run_history_job_id_seq OWNED BY public.job_run_history.job_id;


--
-- TOC entry 435 (class 1259 OID 20902)
-- Name: kpi_anomaly_flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_anomaly_flags (
    flag_id bigint NOT NULL,
    snapshot_date date NOT NULL,
    tenant_id bigint,
    kpi_name character varying(100) NOT NULL,
    kpi_value numeric(18,4),
    mean_30d numeric(18,4),
    stddev_30d numeric(18,4),
    z_score numeric(18,4),
    severity character varying(20),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_anomaly_flags OWNER TO postgres;

--
-- TOC entry 434 (class 1259 OID 20901)
-- Name: kpi_anomaly_flags_flag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_anomaly_flags_flag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kpi_anomaly_flags_flag_id_seq OWNER TO postgres;

--
-- TOC entry 6312 (class 0 OID 0)
-- Dependencies: 434
-- Name: kpi_anomaly_flags_flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_anomaly_flags_flag_id_seq OWNED BY public.kpi_anomaly_flags.flag_id;


--
-- TOC entry 446 (class 1259 OID 20964)
-- Name: kpi_correlations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_correlations (
    corr_id bigint NOT NULL,
    tenant_id bigint,
    kpi_x character varying(100) NOT NULL,
    kpi_y character varying(100) NOT NULL,
    correlation numeric(8,4),
    period_days integer DEFAULT 30,
    calculated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_correlations OWNER TO postgres;

--
-- TOC entry 445 (class 1259 OID 20963)
-- Name: kpi_correlations_corr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_correlations_corr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kpi_correlations_corr_id_seq OWNER TO postgres;

--
-- TOC entry 6313 (class 0 OID 0)
-- Dependencies: 445
-- Name: kpi_correlations_corr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_correlations_corr_id_seq OWNED BY public.kpi_correlations.corr_id;


--
-- TOC entry 433 (class 1259 OID 20886)
-- Name: kpi_daily_snapshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_daily_snapshot (
    snapshot_date date NOT NULL,
    tenant_id bigint NOT NULL,
    total_orders integer DEFAULT 0,
    total_revenue numeric(18,2) DEFAULT 0,
    total_refunds numeric(18,2) DEFAULT 0,
    net_revenue numeric(18,2) DEFAULT 0,
    new_users integer DEFAULT 0,
    purchasers integer DEFAULT 0,
    repeat_customers integer DEFAULT 0,
    repeat_rate numeric(6,3),
    aov numeric(12,2),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_daily_snapshot OWNER TO postgres;

--
-- TOC entry 444 (class 1259 OID 20953)
-- Name: kpi_explainability_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_explainability_logs (
    explain_id bigint NOT NULL,
    snapshot_date date NOT NULL,
    tenant_id bigint,
    kpi_name character varying(100) NOT NULL,
    observed_value numeric(18,4),
    expected_value numeric(18,4),
    deviation_pct numeric(8,3),
    z_score numeric(10,4),
    severity character varying(20),
    reason_summary text,
    related_kpi character varying(100),
    correlation numeric(6,3),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_explainability_logs OWNER TO postgres;

--
-- TOC entry 443 (class 1259 OID 20952)
-- Name: kpi_explainability_logs_explain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_explainability_logs_explain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kpi_explainability_logs_explain_id_seq OWNER TO postgres;

--
-- TOC entry 6314 (class 0 OID 0)
-- Dependencies: 443
-- Name: kpi_explainability_logs_explain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_explainability_logs_explain_id_seq OWNED BY public.kpi_explainability_logs.explain_id;


--
-- TOC entry 438 (class 1259 OID 20921)
-- Name: kpi_forecast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_forecast (
    forecast_date date NOT NULL,
    tenant_id bigint NOT NULL,
    kpi_name character varying(100) NOT NULL,
    forecast_value numeric(18,4),
    lower_band numeric(18,4),
    upper_band numeric(18,4),
    method character varying(50) DEFAULT 'linreg_rolling'::character varying,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_forecast OWNER TO postgres;

--
-- TOC entry 439 (class 1259 OID 20929)
-- Name: kpi_thresholds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_thresholds (
    tenant_id bigint NOT NULL,
    kpi_name character varying(100) NOT NULL,
    mean_30d numeric(18,4),
    stddev_30d numeric(18,4),
    lower_alert numeric(18,4),
    upper_alert numeric(18,4),
    z_used numeric(10,4) DEFAULT 3.0,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.kpi_thresholds OWNER TO postgres;

--
-- TOC entry 424 (class 1259 OID 20770)
-- Name: login_failures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_failures (
    failure_id bigint NOT NULL,
    user_id bigint,
    attempt_time timestamp with time zone DEFAULT now(),
    ip_address inet,
    reason text
);


ALTER TABLE public.login_failures OWNER TO postgres;

--
-- TOC entry 423 (class 1259 OID 20769)
-- Name: login_failures_failure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_failures_failure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_failures_failure_id_seq OWNER TO postgres;

--
-- TOC entry 6315 (class 0 OID 0)
-- Dependencies: 423
-- Name: login_failures_failure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_failures_failure_id_seq OWNED BY public.login_failures.failure_id;


--
-- TOC entry 376 (class 1259 OID 18921)
-- Name: lookup_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookup_statuses (
    status_key text NOT NULL,
    description text,
    label character varying(255)
);


ALTER TABLE public.lookup_statuses OWNER TO postgres;

--
-- TOC entry 367 (class 1259 OID 17838)
-- Name: loyalty_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loyalty_points (
    loyalty_id bigint NOT NULL,
    user_id bigint NOT NULL,
    points integer DEFAULT 0 NOT NULL,
    reason character varying(255),
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.loyalty_points OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 17837)
-- Name: loyalty_points_loyalty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loyalty_points_loyalty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loyalty_points_loyalty_id_seq OWNER TO postgres;

--
-- TOC entry 6316 (class 0 OID 0)
-- Dependencies: 366
-- Name: loyalty_points_loyalty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loyalty_points_loyalty_id_seq OWNED BY public.loyalty_points.loyalty_id;


--
-- TOC entry 293 (class 1259 OID 16976)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    message_id bigint NOT NULL,
    chat_room_id bigint NOT NULL,
    sender_id bigint,
    receiver_id bigint,
    sender_role text,
    receiver_role text,
    message_type text DEFAULT 'text'::text,
    content text,
    file_url text,
    read_status text DEFAULT 'unseen'::text,
    sent_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 16975)
-- Name: messages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ALTER COLUMN message_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.messages_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 586 (class 1259 OID 22035)
-- Name: mv_stream_sales_5m; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.mv_stream_sales_5m AS
 SELECT date_trunc('minute'::text, COALESCE(p.paid_at, o.created_at)) AS sale_minute,
    count(DISTINCT o.order_id) AS orders_count,
    (COALESCE(sum(p.amount), (0)::numeric))::numeric(18,2) AS revenue
   FROM (public.orders o
     LEFT JOIN public.payments p ON ((p.order_id = o.order_id)))
  WHERE (COALESCE(p.paid_at, o.created_at) >= (now() - '1 day'::interval))
  GROUP BY (date_trunc('minute'::text, COALESCE(p.paid_at, o.created_at)))
  ORDER BY (date_trunc('minute'::text, COALESCE(p.paid_at, o.created_at))) DESC
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.mv_stream_sales_5m OWNER TO postgres;

--
-- TOC entry 456 (class 1259 OID 21060)
-- Name: notification_delivery_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_delivery_logs (
    log_id bigint NOT NULL,
    alert_id bigint,
    rule_id bigint,
    channel character varying(50),
    target text,
    message text,
    status character varying(20) DEFAULT 'pending'::character varying,
    response text,
    created_at timestamp with time zone DEFAULT now(),
    sent_at timestamp with time zone
);


ALTER TABLE public.notification_delivery_logs OWNER TO postgres;

--
-- TOC entry 455 (class 1259 OID 21059)
-- Name: notification_delivery_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_delivery_logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_delivery_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 6317 (class 0 OID 0)
-- Dependencies: 455
-- Name: notification_delivery_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_delivery_logs_log_id_seq OWNED BY public.notification_delivery_logs.log_id;


--
-- TOC entry 339 (class 1259 OID 17685)
-- Name: notification_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_templates (
    template_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    channel character varying(20) DEFAULT 'in_app'::character varying,
    subject character varying(255),
    body text,
    variables jsonb,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    body_template text
);


ALTER TABLE public.notification_templates OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 17684)
-- Name: notification_templates_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_templates_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_templates_template_id_seq OWNER TO postgres;

--
-- TOC entry 6318 (class 0 OID 0)
-- Dependencies: 338
-- Name: notification_templates_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_templates_template_id_seq OWNED BY public.notification_templates.template_id;


--
-- TOC entry 289 (class 1259 OID 16955)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    notification_id bigint NOT NULL,
    sender_id bigint,
    receiver_id bigint,
    receiver_role text,
    type text,
    title text,
    message text,
    related_entity text,
    entity_id bigint,
    is_read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 16954)
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.notifications ALTER COLUMN notification_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 317 (class 1259 OID 17562)
-- Name: order_invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_invoices (
    invoice_id bigint NOT NULL,
    order_id bigint NOT NULL,
    invoice_number character varying(100) NOT NULL,
    issued_to text,
    billing_address text,
    amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    pdf_url character varying(1024),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.order_invoices OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 17561)
-- Name: order_invoices_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_invoices_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_invoices_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 6319 (class 0 OID 0)
-- Dependencies: 316
-- Name: order_invoices_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_invoices_invoice_id_seq OWNED BY public.order_invoices.invoice_id;


--
-- TOC entry 299 (class 1259 OID 17047)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint,
    variant_id bigint,
    quantity integer DEFAULT 1,
    price numeric(12,2),
    subtotal numeric(14,2),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 17046)
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_items ALTER COLUMN order_item_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_items_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 275 (class 1259 OID 16832)
-- Name: order_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_management (
    record_id bigint NOT NULL,
    order_id bigint,
    admin_id bigint,
    action text,
    details jsonb,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.order_management OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16831)
-- Name: order_management_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_management ALTER COLUMN record_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_management_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 315 (class 1259 OID 17551)
-- Name: order_status_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_logs (
    log_id bigint NOT NULL,
    order_id bigint NOT NULL,
    previous_status character varying(50),
    new_status character varying(50) NOT NULL,
    changed_by_type character varying(20) DEFAULT 'system'::character varying,
    changed_by_id bigint,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.order_status_logs OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 17550)
-- Name: order_status_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_status_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 6320 (class 0 OID 0)
-- Dependencies: 314
-- Name: order_status_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_logs_log_id_seq OWNED BY public.order_status_logs.log_id;


--
-- TOC entry 296 (class 1259 OID 17014)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN order_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 300 (class 1259 OID 17071)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN payment_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payments_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 398 (class 1259 OID 19705)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    permission_id bigint NOT NULL,
    permission_key character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 397 (class 1259 OID 19704)
-- Name: permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_permission_id_seq OWNER TO postgres;

--
-- TOC entry 6321 (class 0 OID 0)
-- Dependencies: 397
-- Name: permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;


--
-- TOC entry 426 (class 1259 OID 20805)
-- Name: product_affinity; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.product_affinity AS
 SELECT LEAST(oi1.product_id, oi2.product_id) AS product_id_a,
    GREATEST(oi1.product_id, oi2.product_id) AS product_id_b,
    (count(*))::integer AS co_purchase_count
   FROM (public.order_items oi1
     JOIN public.order_items oi2 ON (((oi1.order_id = oi2.order_id) AND (oi1.product_id <> oi2.product_id))))
  GROUP BY LEAST(oi1.product_id, oi2.product_id), GREATEST(oi1.product_id, oi2.product_id)
 HAVING (count(*) > 0)
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.product_affinity OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 17588)
-- Name: product_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_attributes (
    attribute_id bigint NOT NULL,
    product_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.product_attributes OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 17587)
-- Name: product_attributes_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_attributes_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attributes_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 6322 (class 0 OID 0)
-- Dependencies: 320
-- Name: product_attributes_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attributes_attribute_id_seq OWNED BY public.product_attributes.attribute_id;


--
-- TOC entry 235 (class 1259 OID 16457)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id bigint NOT NULL,
    shop_id integer NOT NULL,
    category_id integer NOT NULL,
    product_code character varying(100) NOT NULL,
    product_name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    short_description character varying(500),
    brand character varying(100),
    price numeric(10,2) NOT NULL,
    discount_price numeric(10,2),
    currency character varying(3) DEFAULT 'USD'::character varying,
    stock_qty integer DEFAULT 0,
    unit character varying(50),
    weight numeric(8,3),
    status text DEFAULT 'draft'::character varying,
    label character varying(100),
    tags jsonb,
    search_keywords text,
    rating_avg numeric(3,2) DEFAULT 0.00,
    rating_count integer DEFAULT 0,
    views integer DEFAULT 0,
    favorites integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 17596)
-- Name: user_activity_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activity_logs (
    activity_id bigint NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    device_info character varying(512),
    action character varying(255),
    meta jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    product_id bigint
);


ALTER TABLE public.user_activity_logs OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 20667)
-- Name: product_conversion_stats; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.product_conversion_stats AS
 SELECT p.product_id,
    count(DISTINCT a.activity_id) FILTER (WHERE ((a.action)::text = 'view'::text)) AS total_views,
    count(DISTINCT o.order_id) AS total_orders,
    round(((100.0 * (count(DISTINCT o.order_id))::numeric) / (NULLIF(count(DISTINCT a.activity_id), 0))::numeric), 2) AS conversion_rate
   FROM (((public.products p
     LEFT JOIN public.user_activity_logs a ON ((a.product_id = p.product_id)))
     LEFT JOIN public.order_items oi ON ((oi.product_id = p.product_id)))
     LEFT JOIN public.orders o ON ((o.order_id = oi.order_id)))
  GROUP BY p.product_id
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.product_conversion_stats OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16489)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    image_id bigint NOT NULL,
    product_id integer NOT NULL,
    image_url character varying(500) NOT NULL,
    alt_text character varying(255),
    sort_order integer DEFAULT 0,
    is_main boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16488)
-- Name: product_images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_image_id_seq OWNER TO postgres;

--
-- TOC entry 6323 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_image_id_seq OWNED BY public.product_images.image_id;


--
-- TOC entry 271 (class 1259 OID 16794)
-- Name: product_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_management (
    record_id bigint NOT NULL,
    product_id bigint,
    admin_id bigint,
    action text,
    reason text,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_management OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 16793)
-- Name: product_management_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_management ALTER COLUMN record_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_management_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 405 (class 1259 OID 19896)
-- Name: product_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_recommendations (
    product_id bigint NOT NULL,
    recommended_product_id bigint NOT NULL,
    score numeric(6,4) DEFAULT 0,
    last_updated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_recommendations OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 17576)
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_reviews (
    review_id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint,
    order_id bigint,
    rating smallint NOT NULL,
    title character varying(255),
    comment text,
    images jsonb,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT product_reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.product_reviews OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 17575)
-- Name: product_reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_reviews_review_id_seq OWNER TO postgres;

--
-- TOC entry 6324 (class 0 OID 0)
-- Dependencies: 318
-- Name: product_reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_reviews_review_id_seq OWNED BY public.product_reviews.review_id;


--
-- TOC entry 243 (class 1259 OID 16542)
-- Name: product_tag_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag_map (
    map_id integer NOT NULL,
    product_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_tag_map OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16541)
-- Name: product_tag_map_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_tag_map_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_tag_map_map_id_seq OWNER TO postgres;

--
-- TOC entry 6325 (class 0 OID 0)
-- Dependencies: 242
-- Name: product_tag_map_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_tag_map_map_id_seq OWNED BY public.product_tag_map.map_id;


--
-- TOC entry 241 (class 1259 OID 16527)
-- Name: product_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tags (
    tag_id integer NOT NULL,
    tag_name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    status character varying(20) DEFAULT 'active'::character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_tags OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16526)
-- Name: product_tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_tags_tag_id_seq OWNER TO postgres;

--
-- TOC entry 6326 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_tags_tag_id_seq OWNED BY public.product_tags.tag_id;


--
-- TOC entry 387 (class 1259 OID 19601)
-- Name: product_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_translations (
    translation_id bigint NOT NULL,
    product_id bigint,
    language_code character varying(10) NOT NULL,
    name_translated text,
    description_translated text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_translations OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 19600)
-- Name: product_translations_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_translations_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_translations_translation_id_seq OWNER TO postgres;

--
-- TOC entry 6327 (class 0 OID 0)
-- Dependencies: 386
-- Name: product_translations_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_translations_translation_id_seq OWNED BY public.product_translations.translation_id;


--
-- TOC entry 239 (class 1259 OID 16506)
-- Name: product_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variants (
    variant_id bigint NOT NULL,
    product_id integer NOT NULL,
    variant_name character varying(255) NOT NULL,
    sku character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    stock_qty integer DEFAULT 0,
    attributes jsonb,
    is_default boolean DEFAULT false,
    status character varying(20) DEFAULT 'active'::character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_variants OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16505)
-- Name: product_variants_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variants_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variants_variant_id_seq OWNER TO postgres;

--
-- TOC entry 6328 (class 0 OID 0)
-- Dependencies: 238
-- Name: product_variants_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variants_variant_id_seq OWNED BY public.product_variants.variant_id;


--
-- TOC entry 234 (class 1259 OID 16456)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 6329 (class 0 OID 0)
-- Dependencies: 234
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 385 (class 1259 OID 19575)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    promotion_id bigint NOT NULL,
    code character varying(100),
    title character varying(255),
    description text,
    discount_type character varying(20) DEFAULT 'fixed'::character varying,
    discount_value numeric(12,4) DEFAULT 0,
    currency character varying(10) DEFAULT 'USD'::character varying,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    min_order_value numeric(12,2) DEFAULT 0,
    max_uses integer,
    used_count integer DEFAULT 0,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT promotions_discount_nonnegative CHECK ((discount_value >= (0)::numeric)),
    CONSTRAINT promotions_discount_type_check CHECK (((discount_type)::text = ANY ((ARRAY['percent'::character varying, 'fixed'::character varying])::text[])))
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 19574)
-- Name: promotions_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotions_promotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotions_promotion_id_seq OWNER TO postgres;

--
-- TOC entry 6330 (class 0 OID 0)
-- Dependencies: 384
-- Name: promotions_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotions_promotion_id_seq OWNED BY public.promotions.promotion_id;


--
-- TOC entry 357 (class 1259 OID 17784)
-- Name: refund_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund_items (
    refund_item_id bigint NOT NULL,
    refund_id bigint NOT NULL,
    order_item_id bigint,
    product_id bigint,
    quantity integer DEFAULT 1,
    reason text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.refund_items OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 17783)
-- Name: refund_items_refund_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refund_items_refund_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refund_items_refund_item_id_seq OWNER TO postgres;

--
-- TOC entry 6331 (class 0 OID 0)
-- Dependencies: 356
-- Name: refund_items_refund_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refund_items_refund_item_id_seq OWNED BY public.refund_items.refund_item_id;


--
-- TOC entry 302 (class 1259 OID 17099)
-- Name: refunds_refund_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.refunds ALTER COLUMN refund_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.refunds_refund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 394 (class 1259 OID 19667)
-- Name: returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.returns (
    return_id bigint NOT NULL,
    order_item_id bigint,
    user_id bigint,
    reason text,
    status_key character varying(100) DEFAULT 'pending'::character varying,
    requested_at timestamp with time zone DEFAULT now(),
    processed_at timestamp with time zone,
    resolution text
);


ALTER TABLE public.returns OWNER TO postgres;

--
-- TOC entry 393 (class 1259 OID 19666)
-- Name: returns_return_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.returns_return_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.returns_return_id_seq OWNER TO postgres;

--
-- TOC entry 6332 (class 0 OID 0)
-- Dependencies: 393
-- Name: returns_return_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.returns_return_id_seq OWNED BY public.returns.return_id;


--
-- TOC entry 409 (class 1259 OID 19943)
-- Name: risk_flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.risk_flags (
    flag_id bigint NOT NULL,
    user_id bigint,
    order_id bigint,
    risk_type character varying(100),
    score numeric(5,2) DEFAULT 0,
    details jsonb,
    detected_at timestamp with time zone DEFAULT now(),
    resolved boolean DEFAULT false,
    resolved_at timestamp with time zone
);


ALTER TABLE public.risk_flags OWNER TO postgres;

--
-- TOC entry 408 (class 1259 OID 19942)
-- Name: risk_flags_flag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.risk_flags_flag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.risk_flags_flag_id_seq OWNER TO postgres;

--
-- TOC entry 6333 (class 0 OID 0)
-- Dependencies: 408
-- Name: risk_flags_flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.risk_flags_flag_id_seq OWNED BY public.risk_flags.flag_id;


--
-- TOC entry 400 (class 1259 OID 19716)
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    role_id bigint,
    permission_id bigint
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- TOC entry 399 (class 1259 OID 19715)
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 6334 (class 0 OID 0)
-- Dependencies: 399
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- TOC entry 396 (class 1259 OID 19695)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    role_key character varying(100) NOT NULL,
    label character varying(255),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 395 (class 1259 OID 19694)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_role_id_seq OWNER TO postgres;

--
-- TOC entry 6335 (class 0 OID 0)
-- Dependencies: 395
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- TOC entry 583 (class 1259 OID 22000)
-- Name: rt_consumers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_consumers (
    consumer_id bigint NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rt_consumers OWNER TO postgres;

--
-- TOC entry 582 (class 1259 OID 21999)
-- Name: rt_consumers_consumer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rt_consumers_consumer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rt_consumers_consumer_id_seq OWNER TO postgres;

--
-- TOC entry 6336 (class 0 OID 0)
-- Dependencies: 582
-- Name: rt_consumers_consumer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rt_consumers_consumer_id_seq OWNED BY public.rt_consumers.consumer_id;


--
-- TOC entry 584 (class 1259 OID 22011)
-- Name: rt_event_offsets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_event_offsets (
    consumer_id bigint NOT NULL,
    last_event_id bigint DEFAULT 0,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rt_event_offsets OWNER TO postgres;

--
-- TOC entry 580 (class 1259 OID 21981)
-- Name: rt_event_outbox_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rt_event_outbox_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rt_event_outbox_event_id_seq OWNER TO postgres;

--
-- TOC entry 6337 (class 0 OID 0)
-- Dependencies: 580
-- Name: rt_event_outbox_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rt_event_outbox_event_id_seq OWNED BY public.rt_event_outbox.event_id;


--
-- TOC entry 579 (class 1259 OID 21969)
-- Name: rt_event_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_event_topics (
    topic_id bigint NOT NULL,
    name text NOT NULL,
    retention_days integer DEFAULT 7,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rt_event_topics OWNER TO postgres;

--
-- TOC entry 578 (class 1259 OID 21968)
-- Name: rt_event_topics_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rt_event_topics_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rt_event_topics_topic_id_seq OWNER TO postgres;

--
-- TOC entry 6338 (class 0 OID 0)
-- Dependencies: 578
-- Name: rt_event_topics_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rt_event_topics_topic_id_seq OWNED BY public.rt_event_topics.topic_id;


--
-- TOC entry 591 (class 1259 OID 22091)
-- Name: rt_job_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_job_schedule (
    job_name text NOT NULL,
    job_interval interval NOT NULL,
    last_run timestamp with time zone,
    next_run timestamp with time zone DEFAULT (now() + '00:01:00'::interval),
    active boolean DEFAULT true
);


ALTER TABLE public.rt_job_schedule OWNER TO postgres;

--
-- TOC entry 590 (class 1259 OID 22069)
-- Name: rt_webhook_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_webhook_deliveries (
    delivery_id bigint NOT NULL,
    webhook_id bigint,
    event_id bigint,
    status character varying(50) DEFAULT 'pending'::character varying,
    attempts integer DEFAULT 0,
    last_attempt timestamp with time zone,
    next_attempt timestamp with time zone,
    response_code integer,
    response_body text,
    error_message text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rt_webhook_deliveries OWNER TO postgres;

--
-- TOC entry 589 (class 1259 OID 22068)
-- Name: rt_webhook_deliveries_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rt_webhook_deliveries_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rt_webhook_deliveries_delivery_id_seq OWNER TO postgres;

--
-- TOC entry 6339 (class 0 OID 0)
-- Dependencies: 589
-- Name: rt_webhook_deliveries_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rt_webhook_deliveries_delivery_id_seq OWNED BY public.rt_webhook_deliveries.delivery_id;


--
-- TOC entry 588 (class 1259 OID 22057)
-- Name: rt_webhook_endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rt_webhook_endpoints (
    webhook_id bigint NOT NULL,
    tenant_id bigint DEFAULT 1,
    name character varying(200) NOT NULL,
    target_url text NOT NULL,
    secret_token text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rt_webhook_endpoints OWNER TO postgres;

--
-- TOC entry 587 (class 1259 OID 22056)
-- Name: rt_webhook_endpoints_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rt_webhook_endpoints_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rt_webhook_endpoints_webhook_id_seq OWNER TO postgres;

--
-- TOC entry 6340 (class 0 OID 0)
-- Dependencies: 587
-- Name: rt_webhook_endpoints_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rt_webhook_endpoints_webhook_id_seq OWNED BY public.rt_webhook_endpoints.webhook_id;


--
-- TOC entry 414 (class 1259 OID 20355)
-- Name: sales_by_day; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.sales_by_day AS
 SELECT (COALESCE(p.paid_at, o.created_at))::date AS sale_date,
    count(DISTINCT o.order_id) AS total_orders,
    COALESCE(sum(p.amount), (0)::numeric) AS total_revenue
   FROM (public.orders o
     LEFT JOIN public.payments p ON ((p.order_id = o.order_id)))
  GROUP BY ((COALESCE(p.paid_at, o.created_at))::date)
  ORDER BY ((COALESCE(p.paid_at, o.created_at))::date) DESC
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.sales_by_day OWNER TO postgres;

--
-- TOC entry 415 (class 1259 OID 20644)
-- Name: sales_forecast; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.sales_forecast AS
 SELECT sale_date AS report_date,
    total_orders,
    total_revenue,
    round(avg(total_revenue) OVER (ORDER BY sale_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS moving_avg_7d,
    round(avg(total_revenue) OVER (ORDER BY sale_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW), 2) AS moving_avg_30d
   FROM public.sales_by_day s
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.sales_forecast OWNER TO postgres;

--
-- TOC entry 373 (class 1259 OID 17869)
-- Name: seo_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seo_metadata (
    seo_id bigint NOT NULL,
    entity_type character varying(50) NOT NULL,
    entity_id bigint NOT NULL,
    meta_title character varying(255),
    meta_description character varying(512),
    meta_keywords character varying(512),
    structured_data jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.seo_metadata OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 17868)
-- Name: seo_metadata_seo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seo_metadata_seo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seo_metadata_seo_id_seq OWNER TO postgres;

--
-- TOC entry 6341 (class 0 OID 0)
-- Dependencies: 372
-- Name: seo_metadata_seo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seo_metadata_seo_id_seq OWNED BY public.seo_metadata.seo_id;


--
-- TOC entry 652 (class 1259 OID 22715)
-- Name: shop_bots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_bots (
    bot_id bigint NOT NULL,
    shop_id bigint,
    owner_user_id bigint,
    bot_name text,
    bot_token text,
    webhook_url text,
    status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.shop_bots OWNER TO postgres;

--
-- TOC entry 651 (class 1259 OID 22714)
-- Name: shop_bots_bot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_bots_bot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_bots_bot_id_seq OWNER TO postgres;

--
-- TOC entry 6342 (class 0 OID 0)
-- Dependencies: 651
-- Name: shop_bots_bot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_bots_bot_id_seq OWNED BY public.shop_bots.bot_id;


--
-- TOC entry 269 (class 1259 OID 16775)
-- Name: shop_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_management (
    record_id bigint NOT NULL,
    shop_id bigint,
    admin_id bigint,
    action text,
    remarks text,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.shop_management OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16774)
-- Name: shop_management_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_management ALTER COLUMN record_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shop_management_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 307 (class 1259 OID 17142)
-- Name: shop_payouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_payouts (
    payout_id bigint NOT NULL,
    shop_id bigint,
    amount numeric(14,2),
    currency text,
    payment_method text,
    transaction_ref text,
    status text DEFAULT 'pending'::text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.shop_payouts OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 17141)
-- Name: shop_payouts_payout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_payouts ALTER COLUMN payout_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shop_payouts_payout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16411)
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops (
    shop_id bigint NOT NULL,
    shop_code character varying(50) NOT NULL,
    shop_name character varying(255) NOT NULL,
    shop_slug character varying(255) NOT NULL,
    description text,
    tagline character varying(255),
    shop_type character varying(50) NOT NULL,
    owner_name character varying(100),
    business_name character varying(255),
    contact_email character varying(255),
    contact_phone character varying(50),
    address_line1 character varying(500),
    village_group character varying(100),
    commune character varying(100),
    district character varying(100),
    city_province character varying(100),
    country character varying(100) DEFAULT 'Cambodia'::character varying,
    latitude numeric(10,6),
    longitude numeric(10,6),
    shop_logo character varying(500),
    theme_color character varying(7) DEFAULT '#000000'::character varying,
    rating_average numeric(3,2) DEFAULT 0.00,
    review_count integer DEFAULT 0,
    status character varying(20) DEFAULT 'pending'::character varying,
    verified boolean DEFAULT false,
    payment_methods jsonb,
    delivery_methods jsonb,
    view_count integer DEFAULT 0,
    meta_title character varying(255),
    membership_level character varying(20) DEFAULT 'basic'::character varying,
    badges jsonb,
    bot character varying(100),
    channel character varying(100),
    shop_group character varying(100),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    tenant_id bigint DEFAULT 1
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 19498)
-- Name: shop_sales_summary; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.shop_sales_summary AS
 SELECT s.shop_id,
    s.shop_name,
    count(o.order_id) AS total_orders,
    COALESCE(sum(p.amount), (0)::numeric) AS total_revenue,
    max(p.paid_at) AS last_payment_date
   FROM ((public.shops s
     LEFT JOIN public.orders o ON ((s.shop_id = o.shop_id)))
     LEFT JOIN public.payments p ON ((o.order_id = p.order_id)))
  GROUP BY s.shop_id, s.shop_name
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.shop_sales_summary OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 17762)
-- Name: shop_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_wallets (
    wallet_id bigint NOT NULL,
    shop_id bigint NOT NULL,
    balance numeric(18,2) DEFAULT 0.00 NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.shop_wallets OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 17761)
-- Name: shop_wallets_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_wallets_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_wallets_wallet_id_seq OWNER TO postgres;

--
-- TOC entry 6343 (class 0 OID 0)
-- Dependencies: 352
-- Name: shop_wallets_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_wallets_wallet_id_seq OWNED BY public.shop_wallets.wallet_id;


--
-- TOC entry 230 (class 1259 OID 16410)
-- Name: shops_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shops_shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shops_shop_id_seq OWNER TO postgres;

--
-- TOC entry 6344 (class 0 OID 0)
-- Dependencies: 230
-- Name: shops_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shops_shop_id_seq OWNED BY public.shops.shop_id;


--
-- TOC entry 380 (class 1259 OID 19537)
-- Name: stock_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_transactions (
    transaction_id bigint NOT NULL,
    product_id bigint,
    change_qty integer NOT NULL,
    reason character varying(100),
    reference_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    warehouse_id bigint
);


ALTER TABLE public.stock_transactions OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 19536)
-- Name: stock_transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_transactions_transaction_id_seq OWNER TO postgres;

--
-- TOC entry 6345 (class 0 OID 0)
-- Dependencies: 379
-- Name: stock_transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_transactions_transaction_id_seq OWNED BY public.stock_transactions.transaction_id;


--
-- TOC entry 371 (class 1259 OID 17859)
-- Name: store_credits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_credits (
    credit_id bigint NOT NULL,
    user_id bigint NOT NULL,
    amount numeric(15,2) DEFAULT 0.00 NOT NULL,
    currency character varying(10) DEFAULT 'USD'::character varying,
    reason character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_credits OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 17858)
-- Name: store_credits_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_credits_credit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_credits_credit_id_seq OWNER TO postgres;

--
-- TOC entry 6346 (class 0 OID 0)
-- Dependencies: 370
-- Name: store_credits_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_credits_credit_id_seq OWNED BY public.store_credits.credit_id;


--
-- TOC entry 327 (class 1259 OID 17617)
-- Name: support_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_tickets (
    ticket_id bigint NOT NULL,
    user_id bigint,
    shop_id bigint,
    subject character varying(255) NOT NULL,
    message text NOT NULL,
    priority character varying(10) DEFAULT 'medium'::character varying,
    status character varying(20) DEFAULT 'open'::character varying,
    assigned_admin_id bigint,
    closed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.support_tickets OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 17616)
-- Name: support_tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_tickets_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.support_tickets_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 6347 (class 0 OID 0)
-- Dependencies: 326
-- Name: support_tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_tickets_ticket_id_seq OWNED BY public.support_tickets.ticket_id;


--
-- TOC entry 607 (class 1259 OID 22292)
-- Name: sys_audit_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_audit_log (
    audit_id bigint NOT NULL,
    tenant_id bigint,
    user_id bigint,
    event_type character varying(100),
    table_name character varying(100),
    record_id bigint,
    action jsonb,
    ip_address inet,
    created_at timestamp with time zone DEFAULT now(),
    signature text
);


ALTER TABLE public.sys_audit_log OWNER TO postgres;

--
-- TOC entry 606 (class 1259 OID 22291)
-- Name: sys_audit_log_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_audit_log_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_audit_log_audit_id_seq OWNER TO postgres;

--
-- TOC entry 6348 (class 0 OID 0)
-- Dependencies: 606
-- Name: sys_audit_log_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_audit_log_audit_id_seq OWNED BY public.sys_audit_log.audit_id;


--
-- TOC entry 638 (class 1259 OID 22566)
-- Name: sys_compliance_findings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_compliance_findings (
    finding_id bigint NOT NULL,
    checked_at timestamp with time zone DEFAULT now(),
    category text,
    object_schema text,
    object_name text,
    severity text,
    finding text,
    advice text,
    auto_fix_possible boolean DEFAULT false,
    fixed boolean DEFAULT false,
    fixed_at timestamp with time zone
);


ALTER TABLE public.sys_compliance_findings OWNER TO postgres;

--
-- TOC entry 637 (class 1259 OID 22565)
-- Name: sys_compliance_findings_finding_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_compliance_findings_finding_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_compliance_findings_finding_id_seq OWNER TO postgres;

--
-- TOC entry 6349 (class 0 OID 0)
-- Dependencies: 637
-- Name: sys_compliance_findings_finding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_compliance_findings_finding_id_seq OWNED BY public.sys_compliance_findings.finding_id;


--
-- TOC entry 645 (class 1259 OID 22659)
-- Name: sys_control_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_control_policies (
    policy_id bigint NOT NULL,
    tenant_id bigint DEFAULT 1,
    component character varying(100) NOT NULL,
    max_rps numeric(10,2) DEFAULT 100,
    target_latency_ms numeric(10,2) DEFAULT 250,
    scale_floor character varying(30) DEFAULT 'maintain'::character varying,
    cost_guard numeric(18,2) DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_control_policies OWNER TO postgres;

--
-- TOC entry 644 (class 1259 OID 22658)
-- Name: sys_control_policies_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_control_policies_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_control_policies_policy_id_seq OWNER TO postgres;

--
-- TOC entry 6350 (class 0 OID 0)
-- Dependencies: 644
-- Name: sys_control_policies_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_control_policies_policy_id_seq OWNED BY public.sys_control_policies.policy_id;


--
-- TOC entry 642 (class 1259 OID 22647)
-- Name: sys_enterprise_kpi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_enterprise_kpi (
    snapshot_time timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1,
    revenue_24h numeric(18,2),
    orders_24h bigint,
    new_users_24h bigint,
    avg_aov numeric(10,2),
    ai_accuracy numeric(6,2),
    ai_confidence numeric(6,2),
    alerts_open integer,
    escalations_open integer,
    compliance_findings integer,
    governance_score numeric(10,2),
    enterprise_index numeric(10,2)
);


ALTER TABLE public.sys_enterprise_kpi OWNER TO postgres;

--
-- TOC entry 596 (class 1259 OID 22141)
-- Name: sys_health_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_health_events (
    event_id bigint NOT NULL,
    event_type text NOT NULL,
    severity text DEFAULT 'info'::text,
    details text,
    detected_at timestamp with time zone DEFAULT now(),
    resolved_at timestamp with time zone,
    resolution_action text
);


ALTER TABLE public.sys_health_events OWNER TO postgres;

--
-- TOC entry 595 (class 1259 OID 22140)
-- Name: sys_health_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_health_events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_health_events_event_id_seq OWNER TO postgres;

--
-- TOC entry 6351 (class 0 OID 0)
-- Dependencies: 595
-- Name: sys_health_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_health_events_event_id_seq OWNED BY public.sys_health_events.event_id;


--
-- TOC entry 612 (class 1259 OID 22386)
-- Name: sys_heartbeat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_heartbeat (
    tenant_id bigint DEFAULT 1 NOT NULL,
    component character varying(100) NOT NULL,
    last_ping timestamp with time zone DEFAULT now(),
    status character varying(50) DEFAULT 'ok'::character varying,
    latency_ms numeric(10,2)
);


ALTER TABLE public.sys_heartbeat OWNER TO postgres;

--
-- TOC entry 609 (class 1259 OID 22336)
-- Name: sys_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_jobs (
    job_id bigint NOT NULL,
    job_name character varying(200) NOT NULL,
    description text,
    schedule_interval interval DEFAULT '01:00:00'::interval,
    last_run timestamp with time zone,
    next_run timestamp with time zone,
    status character varying(50) DEFAULT 'idle'::character varying,
    last_result text,
    enabled boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_jobs OWNER TO postgres;

--
-- TOC entry 608 (class 1259 OID 22335)
-- Name: sys_jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_jobs_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_jobs_job_id_seq OWNER TO postgres;

--
-- TOC entry 6352 (class 0 OID 0)
-- Dependencies: 608
-- Name: sys_jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_jobs_job_id_seq OWNED BY public.sys_jobs.job_id;


--
-- TOC entry 611 (class 1259 OID 22379)
-- Name: sys_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_metrics (
    metric_id bigint NOT NULL,
    metric_name character varying(100) NOT NULL,
    metric_value numeric(18,4),
    collected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_metrics OWNER TO postgres;

--
-- TOC entry 610 (class 1259 OID 22378)
-- Name: sys_metrics_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_metrics_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_metrics_metric_id_seq OWNER TO postgres;

--
-- TOC entry 6353 (class 0 OID 0)
-- Dependencies: 610
-- Name: sys_metrics_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_metrics_metric_id_seq OWNED BY public.sys_metrics.metric_id;


--
-- TOC entry 635 (class 1259 OID 22551)
-- Name: sys_ops_governance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_ops_governance (
    record_id bigint NOT NULL,
    snapshot_time timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1,
    cpu_load numeric(6,2),
    memory_gb numeric(6,2),
    active_alerts integer,
    unresolved_escalations integer,
    avg_margin numeric(10,2),
    avg_cost numeric(10,2),
    avg_revenue numeric(18,2),
    ai_accuracy numeric(5,2),
    ai_confidence numeric(5,2),
    audit_events integer,
    governance_score numeric(6,2)
);


ALTER TABLE public.sys_ops_governance OWNER TO postgres;

--
-- TOC entry 634 (class 1259 OID 22550)
-- Name: sys_ops_governance_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_ops_governance_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_ops_governance_record_id_seq OWNER TO postgres;

--
-- TOC entry 6354 (class 0 OID 0)
-- Dependencies: 634
-- Name: sys_ops_governance_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_ops_governance_record_id_seq OWNED BY public.sys_ops_governance.record_id;


--
-- TOC entry 640 (class 1259 OID 22578)
-- Name: sys_self_heal_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_self_heal_actions (
    action_id bigint NOT NULL,
    executed_at timestamp with time zone DEFAULT now(),
    action_type text,
    target_schema text,
    target_object text,
    status text DEFAULT 'success'::text,
    details text
);


ALTER TABLE public.sys_self_heal_actions OWNER TO postgres;

--
-- TOC entry 639 (class 1259 OID 22577)
-- Name: sys_self_heal_actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_self_heal_actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_self_heal_actions_action_id_seq OWNER TO postgres;

--
-- TOC entry 6355 (class 0 OID 0)
-- Dependencies: 639
-- Name: sys_self_heal_actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_self_heal_actions_action_id_seq OWNED BY public.sys_self_heal_actions.action_id;


--
-- TOC entry 647 (class 1259 OID 22675)
-- Name: sys_telemetry_ingest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sys_telemetry_ingest (
    telemetry_id bigint NOT NULL,
    ts timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1,
    component character varying(100) NOT NULL,
    requests bigint DEFAULT 0,
    errors bigint DEFAULT 0,
    p95_latency_ms numeric(10,2) DEFAULT 0
);


ALTER TABLE public.sys_telemetry_ingest OWNER TO postgres;

--
-- TOC entry 646 (class 1259 OID 22674)
-- Name: sys_telemetry_ingest_telemetry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sys_telemetry_ingest_telemetry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_telemetry_ingest_telemetry_id_seq OWNER TO postgres;

--
-- TOC entry 6356 (class 0 OID 0)
-- Dependencies: 646
-- Name: sys_telemetry_ingest_telemetry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sys_telemetry_ingest_telemetry_id_seq OWNED BY public.sys_telemetry_ingest.telemetry_id;


--
-- TOC entry 347 (class 1259 OID 17728)
-- Name: system_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_banners (
    banner_id bigint NOT NULL,
    image_url character varying(1024),
    link character varying(1024),
    "position" character varying(100),
    priority integer DEFAULT 0,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.system_banners OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 17727)
-- Name: system_banners_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_banners_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_banners_banner_id_seq OWNER TO postgres;

--
-- TOC entry 6357 (class 0 OID 0)
-- Dependencies: 346
-- Name: system_banners_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_banners_banner_id_seq OWNED BY public.system_banners.banner_id;


--
-- TOC entry 418 (class 1259 OID 20703)
-- Name: system_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_events (
    event_id bigint NOT NULL,
    source_table character varying(100),
    record_id bigint,
    event_type character varying(50),
    payload jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.system_events OWNER TO postgres;

--
-- TOC entry 417 (class 1259 OID 20702)
-- Name: system_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_events_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_events_event_id_seq OWNER TO postgres;

--
-- TOC entry 6358 (class 0 OID 0)
-- Dependencies: 417
-- Name: system_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_events_event_id_seq OWNED BY public.system_events.event_id;


--
-- TOC entry 349 (class 1259 OID 17740)
-- Name: system_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_pages (
    page_id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    meta jsonb,
    visible boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.system_pages OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 17739)
-- Name: system_pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_pages_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_pages_page_id_seq OWNER TO postgres;

--
-- TOC entry 6359 (class 0 OID 0)
-- Dependencies: 348
-- Name: system_pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_pages_page_id_seq OWNED BY public.system_pages.page_id;


--
-- TOC entry 279 (class 1259 OID 16860)
-- Name: system_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_settings (
    setting_id bigint NOT NULL,
    key text,
    value text,
    type text,
    updated_by bigint,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.system_settings OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16859)
-- Name: system_settings_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.system_settings ALTER COLUMN setting_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.system_settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 404 (class 1259 OID 19873)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    tag_id bigint NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 403 (class 1259 OID 19872)
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_tag_id_seq OWNER TO postgres;

--
-- TOC entry 6360 (class 0 OID 0)
-- Dependencies: 403
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags.tag_id;


--
-- TOC entry 487 (class 1259 OID 21339)
-- Name: tenant_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenant_policies (
    tenant_id bigint NOT NULL,
    tenant_name character varying(200),
    sla_tier character varying(50) DEFAULT 'standard'::character varying,
    data_retention_days integer DEFAULT 365,
    allow_data_export boolean DEFAULT true,
    allow_ai_training boolean DEFAULT true,
    pii_masking_level character varying(20) DEFAULT 'standard'::character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.tenant_policies OWNER TO postgres;

--
-- TOC entry 420 (class 1259 OID 20725)
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    tenant_id bigint NOT NULL,
    name character varying(255),
    domain character varying(255),
    api_key character varying(255),
    created_at timestamp with time zone DEFAULT now(),
    active boolean DEFAULT true
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- TOC entry 419 (class 1259 OID 20724)
-- Name: tenants_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tenants_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tenants_tenant_id_seq OWNER TO postgres;

--
-- TOC entry 6361 (class 0 OID 0)
-- Dependencies: 419
-- Name: tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tenants_tenant_id_seq OWNED BY public.tenants.tenant_id;


--
-- TOC entry 322 (class 1259 OID 17595)
-- Name: user_activity_logs_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_activity_logs_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_activity_logs_activity_id_seq OWNER TO postgres;

--
-- TOC entry 6362 (class 0 OID 0)
-- Dependencies: 322
-- Name: user_activity_logs_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_activity_logs_activity_id_seq OWNED BY public.user_activity_logs.activity_id;


--
-- TOC entry 249 (class 1259 OID 16617)
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_addresses (
    address_id bigint NOT NULL,
    user_id bigint NOT NULL,
    label text,
    address text,
    city text,
    country text,
    zip_code text,
    is_default boolean DEFAULT false,
    latitude double precision,
    longitude double precision,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_addresses OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16616)
-- Name: user_addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_addresses ALTER COLUMN address_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_addresses_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 425 (class 1259 OID 20785)
-- Name: user_behavior_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_behavior_metrics (
    user_id bigint NOT NULL,
    total_sessions integer DEFAULT 0,
    total_views integer DEFAULT 0,
    total_add_to_cart integer DEFAULT 0,
    total_purchases integer DEFAULT 0,
    last_active timestamp with time zone,
    rolling_7d_views integer DEFAULT 0,
    rolling_7d_purchases integer DEFAULT 0,
    avg_days_between_orders numeric(10,2),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_behavior_metrics OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16633)
-- Name: user_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favorites (
    favorite_id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_favorites OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16632)
-- Name: user_favorites_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_favorites ALTER COLUMN favorite_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_favorites_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 16813)
-- Name: user_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_management (
    record_id bigint NOT NULL,
    user_id bigint,
    admin_id bigint,
    action text,
    remarks text,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_management OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 16812)
-- Name: user_management_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_management ALTER COLUMN record_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_management_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 427 (class 1259 OID 20815)
-- Name: user_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_recommendations (
    user_id bigint NOT NULL,
    recommended_product_id bigint NOT NULL,
    score numeric(10,4) DEFAULT 0 NOT NULL,
    reason text,
    last_updated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_recommendations OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16652)
-- Name: user_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_reviews (
    review_id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    rating smallint,
    comment text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT user_reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.user_reviews OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16651)
-- Name: user_reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_reviews ALTER COLUMN review_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 402 (class 1259 OID 19735)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    user_id bigint,
    role_id bigint
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 401 (class 1259 OID 19734)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_roles_id_seq OWNER TO postgres;

--
-- TOC entry 6363 (class 0 OID 0)
-- Dependencies: 401
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- TOC entry 422 (class 1259 OID 20754)
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_sessions (
    session_id bigint NOT NULL,
    user_id bigint,
    ip_address inet,
    user_agent text,
    login_time timestamp with time zone DEFAULT now(),
    logout_time timestamp with time zone,
    active boolean DEFAULT true
);


ALTER TABLE public.user_sessions OWNER TO postgres;

--
-- TOC entry 421 (class 1259 OID 20753)
-- Name: user_sessions_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_sessions_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_sessions_session_id_seq OWNER TO postgres;

--
-- TOC entry 6364 (class 0 OID 0)
-- Dependencies: 421
-- Name: user_sessions_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_sessions_session_id_seq OWNED BY public.user_sessions.session_id;


--
-- TOC entry 255 (class 1259 OID 16673)
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tokens (
    token_id bigint NOT NULL,
    user_id bigint NOT NULL,
    access_token text NOT NULL,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_tokens OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16672)
-- Name: user_tokens_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_tokens ALTER COLUMN token_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_tokens_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 325 (class 1259 OID 17606)
-- Name: user_verifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_verifications (
    verification_id bigint NOT NULL,
    user_id bigint NOT NULL,
    method character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    payload jsonb,
    admin_id bigint,
    reviewed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_verifications OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 17605)
-- Name: user_verifications_verification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_verifications_verification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_verifications_verification_id_seq OWNER TO postgres;

--
-- TOC entry 6365 (class 0 OID 0)
-- Dependencies: 324
-- Name: user_verifications_verification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_verifications_verification_id_seq OWNED BY public.user_verifications.verification_id;


--
-- TOC entry 245 (class 1259 OID 16575)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    role text DEFAULT 'customer'::text NOT NULL,
    username text,
    email text,
    phone text,
    password_hash text,
    full_name text,
    gender text,
    dob date,
    avatar_url text,
    bio text,
    language text,
    currency text,
    country text,
    city text,
    address text,
    zip_code text,
    latitude double precision,
    longitude double precision,
    status text DEFAULT 'active'::text,
    is_verified boolean DEFAULT false,
    register_method text,
    last_login timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    tenant_id bigint DEFAULT 1,
    telegram_id bigint,
    first_name text,
    last_name text,
    language_code text,
    is_bot boolean DEFAULT false,
    last_seen timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16594)
-- Name: users_seller_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_seller_info (
    seller_id bigint NOT NULL,
    user_id bigint NOT NULL,
    shop_id bigint,
    business_name text,
    seller_status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.users_seller_info OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16593)
-- Name: users_seller_info_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users_seller_info ALTER COLUMN seller_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_seller_info_seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 16574)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 561 (class 1259 OID 21862)
-- Name: v_active_strategies; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_active_strategies AS
 SELECT tenant_id,
    strategy_id,
    strategy_name,
    generation_no,
    performance_score,
    reward_avg,
    confidence_avg,
    volatility,
    created_at
   FROM public.ai_strategy_versions
  WHERE (is_active = true);


ALTER VIEW public.v_active_strategies OWNER TO postgres;

--
-- TOC entry 534 (class 1259 OID 21699)
-- Name: v_agent_collaboration_log; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_agent_collaboration_log AS
 SELECT n.negotiation_id,
    n.topic,
    n.status,
    n.consensus_score,
    a.agent_name AS leader_agent,
    n.summary,
    n.closed_at
   FROM (public.ai_agent_negotiations n
     LEFT JOIN public.ai_agent_registry a ON ((a.agent_id = n.dominant_agent)))
  ORDER BY n.closed_at DESC;


ALTER VIEW public.v_agent_collaboration_log OWNER TO postgres;

--
-- TOC entry 535 (class 1259 OID 21703)
-- Name: v_agent_performance_matrix; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_agent_performance_matrix AS
 SELECT r.agent_id,
    r.agent_name,
    r.domain,
    round(COALESCE(avg(f.reward_score), (0)::numeric), 3) AS avg_reward,
    count(f.feedback_id) AS total_feedback,
    round(COALESCE(((sum(
        CASE
            WHEN (f.reward_score > 0.9) THEN 1
            ELSE 0
        END))::numeric / (NULLIF(count(f.feedback_id), 0))::numeric), (0)::numeric), 3) AS high_agreement_ratio
   FROM (public.ai_agent_registry r
     LEFT JOIN public.ai_rl_feedback f ON (((f.model_type)::text = (r.domain)::text)))
  GROUP BY r.agent_id, r.agent_name, r.domain
  ORDER BY (round(COALESCE(avg(f.reward_score), (0)::numeric), 3)) DESC;


ALTER VIEW public.v_agent_performance_matrix OWNER TO postgres;

--
-- TOC entry 577 (class 1259 OID 21964)
-- Name: v_ai_audit_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ai_audit_dashboard AS
 SELECT tenant_id,
    model_type,
    parity_ratio,
    opportunity_ratio,
    overall_fairness,
    ( SELECT count(*) AS count
           FROM public.ai_bias_audit_results b
          WHERE ((b.tenant_id = f.tenant_id) AND ((b.model_type)::text = (f.model_type)::text) AND (b.created_at >= f.window_start))) AS recent_bias_checks,
    window_start,
    window_end,
    created_at
   FROM public.ai_fairness_scores f
  ORDER BY created_at DESC;


ALTER VIEW public.v_ai_audit_dashboard OWNER TO postgres;

--
-- TOC entry 465 (class 1259 OID 21133)
-- Name: v_ai_marketing_latest; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ai_marketing_latest AS
 SELECT insight_id,
    snapshot_date,
    tenant_id,
    category_id,
    insight_type,
    description,
    impact_score,
    created_at
   FROM public.ai_marketing_insights
  WHERE (snapshot_date >= ((now())::date - 7))
  ORDER BY impact_score DESC;


ALTER VIEW public.v_ai_marketing_latest OWNER TO postgres;

--
-- TOC entry 464 (class 1259 OID 21129)
-- Name: v_ai_recommendations_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ai_recommendations_recent AS
 SELECT rec_id,
    tenant_id,
    base_product_id,
    recommended_product_id,
    reason,
    confidence,
    created_at
   FROM public.ai_recommendations
  WHERE (created_at >= (now() - '7 days'::interval))
  ORDER BY confidence DESC;


ALTER VIEW public.v_ai_recommendations_recent OWNER TO postgres;

--
-- TOC entry 463 (class 1259 OID 21125)
-- Name: v_ai_trend_top10; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ai_trend_top10 AS
 SELECT trend_id,
    snapshot_date,
    tenant_id,
    entity_type,
    entity_id,
    trend_score,
    momentum,
    demand_level,
    forecast_gap,
    created_at
   FROM public.ai_insight_trends
  WHERE (snapshot_date >= ((now())::date - 7))
  ORDER BY trend_score DESC
 LIMIT 10;


ALTER VIEW public.v_ai_trend_top10 OWNER TO postgres;

--
-- TOC entry 454 (class 1259 OID 21027)
-- Name: v_alert_pending; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_alert_pending AS
 SELECT alert_id,
    rule_id,
    snapshot_date,
    tenant_id,
    kpi_name,
    severity,
    message,
    payload,
    status,
    attempts,
    created_at,
    sent_at
   FROM public.alert_queue
  WHERE ((status)::text = 'pending'::text)
  ORDER BY created_at;


ALTER VIEW public.v_alert_pending OWNER TO postgres;

--
-- TOC entry 453 (class 1259 OID 21023)
-- Name: v_alert_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_alert_recent AS
 SELECT alert_id,
    rule_id,
    snapshot_date,
    tenant_id,
    kpi_name,
    severity,
    message,
    payload,
    status,
    attempts,
    created_at,
    sent_at
   FROM public.alert_queue
  WHERE (created_at >= (now() - '7 days'::interval))
  ORDER BY created_at DESC;


ALTER VIEW public.v_alert_recent OWNER TO postgres;

--
-- TOC entry 632 (class 1259 OID 22539)
-- Name: v_alerts_and_escalations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_alerts_and_escalations AS
 SELECT a.alert_id,
    a.tenant_id,
    a.alert_time,
    a.alert_type,
    a.severity,
    a.message,
    COALESCE(e.status, 'not_escalated'::character varying) AS escalation_status,
    e.attempts,
    e.last_attempt
   FROM (public.ai_budget_alerts a
     LEFT JOIN public.ai_alert_escalations e ON ((e.alert_id = a.alert_id)))
  ORDER BY a.alert_time DESC;


ALTER VIEW public.v_alerts_and_escalations OWNER TO postgres;

--
-- TOC entry 493 (class 1259 OID 21381)
-- Name: v_audit_recent_events; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_audit_recent_events AS
 SELECT a.audit_id,
    a.tenant_id,
    a.user_id,
    a.table_name,
    a.access_type,
    a.access_time,
    a.ip_address,
    a.metadata,
    u.full_name
   FROM (public.audit_access_logs a
     LEFT JOIN public.users u ON ((a.user_id = u.user_id)))
  WHERE (a.access_time >= (now() - '7 days'::interval))
  ORDER BY a.access_time DESC;


ALTER VIEW public.v_audit_recent_events OWNER TO postgres;

--
-- TOC entry 627 (class 1259 OID 22506)
-- Name: v_budget_health_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_budget_health_dashboard AS
 SELECT o.tenant_id,
    o.recommended_budget,
    o.expected_revenue,
    o.target_margin,
    o.confidence,
    a.alert_type,
    a.message,
    a.severity,
    a.alert_time
   FROM (public.ai_budget_optimizer o
     LEFT JOIN LATERAL ( SELECT ai_budget_alerts.alert_type,
            ai_budget_alerts.message,
            ai_budget_alerts.severity,
            ai_budget_alerts.alert_time
           FROM public.ai_budget_alerts
          WHERE (o.tenant_id = ai_budget_alerts.tenant_id)
          ORDER BY ai_budget_alerts.alert_time DESC
         LIMIT 1) a ON (true))
  ORDER BY o.tenant_id, o.created_at DESC;


ALTER VIEW public.v_budget_health_dashboard OWNER TO postgres;

--
-- TOC entry 605 (class 1259 OID 22275)
-- Name: v_campaign_performance_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_campaign_performance_dashboard AS
 SELECT c.campaign_id,
    c.campaign_name,
    c.channel,
    c.status,
    m.total_sent,
    m.total_interacted,
    m.conversion_rate,
    m.roi,
    c.launched_at,
    m.last_updated
   FROM (public.ai_campaigns c
     LEFT JOIN public.ai_campaign_metrics m USING (campaign_id))
  ORDER BY m.last_updated DESC NULLS LAST;


ALTER VIEW public.v_campaign_performance_dashboard OWNER TO postgres;

--
-- TOC entry 477 (class 1259 OID 21269)
-- Name: v_churn_model_metrics_latest; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_churn_model_metrics_latest AS
 SELECT metric_id,
    model_name,
    window_days,
    accuracy,
    "precision",
    recall,
    f1_score,
    evaluated_at
   FROM public.ai_churn_model_metrics
  ORDER BY evaluated_at DESC
 LIMIT 10;


ALTER VIEW public.v_churn_model_metrics_latest OWNER TO postgres;

--
-- TOC entry 475 (class 1259 OID 21261)
-- Name: v_churn_risk_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_churn_risk_summary AS
 SELECT churn_risk,
    count(*) AS total_customers,
    round(avg(churn_probability), 4) AS avg_prob
   FROM public.ai_churn_predictions
  GROUP BY churn_risk
  ORDER BY (round(avg(churn_probability), 4)) DESC;


ALTER VIEW public.v_churn_risk_summary OWNER TO postgres;

--
-- TOC entry 486 (class 1259 OID 21335)
-- Name: v_churn_weights_current; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_churn_weights_current AS
 SELECT model_name,
    w_recency,
    w_frequency,
    w_monetary,
    updated_at
   FROM public.ai_churn_feature_weights;


ALTER VIEW public.v_churn_weights_current OWNER TO postgres;

--
-- TOC entry 545 (class 1259 OID 21760)
-- Name: v_competitive_price_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_competitive_price_summary AS
 SELECT competitor_name,
    count(*) AS total_products,
    round(avg(price_gap), 2) AS avg_price_gap,
    round(avg((((our_price - competitor_price) / NULLIF(competitor_price, (0)::numeric)) * (100)::numeric)), 2) AS pct_difference,
    max(collected_at) AS last_collected
   FROM public.ai_competitor_prices
  GROUP BY competitor_name
  ORDER BY (round(avg(price_gap), 2));


ALTER VIEW public.v_competitive_price_summary OWNER TO postgres;

--
-- TOC entry 641 (class 1259 OID 22591)
-- Name: v_compliance_self_heal_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_compliance_self_heal_dashboard AS
 SELECT checked_at,
    category,
    object_schema,
    object_name,
    severity,
    finding,
    auto_fix_possible,
    fixed,
    fixed_at
   FROM public.sys_compliance_findings f
  ORDER BY checked_at DESC, severity DESC;


ALTER VIEW public.v_compliance_self_heal_dashboard OWNER TO postgres;

--
-- TOC entry 501 (class 1259 OID 21434)
-- Name: v_compliance_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_compliance_summary AS
 SELECT tenant_id,
    count(*) FILTER (WHERE (resolved = false)) AS active_alerts,
    count(*) FILTER (WHERE (resolved = true)) AS resolved_alerts,
    max(detected_at) AS last_alert_time
   FROM public.ai_compliance_alerts
  GROUP BY tenant_id
  ORDER BY (max(detected_at)) DESC;


ALTER VIEW public.v_compliance_summary OWNER TO postgres;

--
-- TOC entry 468 (class 1259 OID 21210)
-- Name: v_customer_top_ltv; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_customer_top_ltv AS
 SELECT u.user_id,
    u.full_name AS name,
    p.total_spent,
    p.lifetime_value,
    p.activity_score
   FROM (public.users u
     JOIN public.ai_customer_profiles p ON ((u.user_id = p.user_id)))
  ORDER BY p.lifetime_value DESC
 LIMIT 20;


ALTER VIEW public.v_customer_top_ltv OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 19554)
-- Name: v_data_integrity_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_data_integrity_summary AS
 SELECT now() AS checked_at,
    ( SELECT count(*) AS count
           FROM public.orders o
          WHERE ((o.user_id IS NULL) OR (NOT (EXISTS ( SELECT 1
                   FROM public.users u
                  WHERE (u.user_id = o.user_id)))))) AS missing_user_in_orders,
    ( SELECT count(*) AS count
           FROM public.orders o
          WHERE ((o.shop_id IS NULL) OR (NOT (EXISTS ( SELECT 1
                   FROM public.shops s
                  WHERE (s.shop_id = o.shop_id)))))) AS missing_shop_in_orders,
    ( SELECT count(*) AS count
           FROM public.payments p
          WHERE ((p.order_id IS NULL) OR (NOT (EXISTS ( SELECT 1
                   FROM public.orders o
                  WHERE (o.order_id = p.order_id)))))) AS orphan_payments,
    ( SELECT count(*) AS count
           FROM public.refunds r
          WHERE ((r.payment_id IS NULL) OR (NOT (EXISTS ( SELECT 1
                   FROM public.payments p
                  WHERE (p.payment_id = r.payment_id)))))) AS orphan_refunds,
    ( SELECT count(*) AS count
           FROM public.deliveries d
          WHERE ((d.order_id IS NULL) OR (NOT (EXISTS ( SELECT 1
                   FROM public.orders o
                  WHERE (o.order_id = d.order_id)))))) AS orphan_deliveries,
    ( SELECT count(*) AS count
           FROM public.stock_transactions st
          WHERE ((st.change_qty < 0) AND (NOT (EXISTS ( SELECT 1
                   FROM public.products p
                  WHERE (p.product_id = st.product_id)))))) AS invalid_stock_reference;


ALTER VIEW public.v_data_integrity_summary OWNER TO postgres;

--
-- TOC entry 6366 (class 0 OID 0)
-- Dependencies: 382
-- Name: VIEW v_data_integrity_summary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW public.v_data_integrity_summary IS 'Provides counts of data integrity issues (missing references, orphaned rows, invalid stock).';


--
-- TOC entry 494 (class 1259 OID 21386)
-- Name: v_data_retention_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_data_retention_summary AS
 SELECT tenant_id,
    table_name,
    sum(affected_rows) AS total_purged,
    max(executed_at) AS last_run
   FROM public.data_retention_jobs
  GROUP BY tenant_id, table_name
  ORDER BY (max(executed_at)) DESC;


ALTER VIEW public.v_data_retention_summary OWNER TO postgres;

--
-- TOC entry 524 (class 1259 OID 21621)
-- Name: v_decision_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_decision_summary AS
 SELECT d.decision_id,
    d.tenant_id,
    p.policy_name,
    d.action_type,
    d.confidence,
    d.expected_reward,
    d.actual_reward,
    d.executed,
    d.executed_at,
    d.created_at,
    d.decision_reason
   FROM (public.ai_decision_events d
     LEFT JOIN public.ai_decision_policies p ON ((d.policy_id = p.policy_id)))
  ORDER BY d.created_at DESC;


ALTER VIEW public.v_decision_summary OWNER TO postgres;

--
-- TOC entry 585 (class 1259 OID 22031)
-- Name: v_event_outbox_pending; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_event_outbox_pending AS
 SELECT event_id,
    topic,
    routing_key,
    created_at
   FROM public.rt_event_outbox
  WHERE (status = 'pending'::text)
  ORDER BY event_id;


ALTER VIEW public.v_event_outbox_pending OWNER TO postgres;

--
-- TOC entry 643 (class 1259 OID 22653)
-- Name: v_executive_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_executive_dashboard AS
 SELECT snapshot_time,
    revenue_24h,
    orders_24h,
    new_users_24h,
    avg_aov,
    ai_accuracy,
    ai_confidence,
    alerts_open,
    escalations_open,
    compliance_findings,
    governance_score,
    enterprise_index,
        CASE
            WHEN (enterprise_index >= (800)::numeric) THEN 'Excellent'::text
            WHEN (enterprise_index >= (600)::numeric) THEN 'Healthy'::text
            WHEN (enterprise_index >= (400)::numeric) THEN 'Warning'::text
            ELSE 'Critical'::text
        END AS enterprise_health
   FROM public.sys_enterprise_kpi
  ORDER BY snapshot_time DESC;


ALTER VIEW public.v_executive_dashboard OWNER TO postgres;

--
-- TOC entry 568 (class 1259 OID 21911)
-- Name: v_federated_training_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_federated_training_summary AS
 SELECT r.round_id,
    r.status,
    r.participant_count,
    r.aggregated_accuracy,
    r.aggregated_loss,
    count(u.update_id) AS updates_received,
    max(r.end_time) AS last_completed
   FROM (public.ai_federated_rounds r
     LEFT JOIN public.ai_federated_updates u ON ((r.round_id = u.round_id)))
  GROUP BY r.round_id, r.status, r.participant_count, r.aggregated_accuracy, r.aggregated_loss
  ORDER BY r.round_id DESC;


ALTER VIEW public.v_federated_training_summary OWNER TO postgres;

--
-- TOC entry 650 (class 1259 OID 22703)
-- Name: v_global_control_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_global_control_dashboard AS
 SELECT now() AS checked_at,
    tenant_id,
    component,
    max_rps,
    target_latency_ms,
    scale_floor,
    cost_guard,
    ( SELECT COALESCE(sum(t.requests), (0)::numeric) AS "coalesce"
           FROM public.sys_telemetry_ingest t
          WHERE (((t.component)::text = (p.component)::text) AND (t.ts > (now() - '00:05:00'::interval)))) AS req_5m,
    ( SELECT COALESCE(sum(t.errors), (0)::numeric) AS "coalesce"
           FROM public.sys_telemetry_ingest t
          WHERE (((t.component)::text = (p.component)::text) AND (t.ts > (now() - '00:05:00'::interval)))) AS err_5m,
    ( SELECT COALESCE(avg(t.p95_latency_ms), (0)::numeric) AS "coalesce"
           FROM public.sys_telemetry_ingest t
          WHERE (((t.component)::text = (p.component)::text) AND (t.ts > (now() - '00:05:00'::interval)))) AS p95_5m,
    ( SELECT ai_scaling_predictions.predicted_cpu_load
           FROM public.ai_scaling_predictions
          ORDER BY ai_scaling_predictions.created_at DESC
         LIMIT 1) AS last_pred_cpu,
    ( SELECT ai_scaling_predictions.predicted_memory_gb
           FROM public.ai_scaling_predictions
          ORDER BY ai_scaling_predictions.created_at DESC
         LIMIT 1) AS last_pred_mem,
    ( SELECT (c.infra_cost + c.ai_cost)
           FROM public.ai_cost_forecasts c
          WHERE (c.tenant_id = p.tenant_id)
          ORDER BY c.created_at DESC
         LIMIT 1) AS last_cost,
    ( SELECT d.decision
           FROM public.ai_global_decisions d
          WHERE ((d.component)::text = (p.component)::text)
          ORDER BY d.decided_at DESC
         LIMIT 1) AS last_decision,
    ( SELECT d.reason
           FROM public.ai_global_decisions d
          WHERE ((d.component)::text = (p.component)::text)
          ORDER BY d.decided_at DESC
         LIMIT 1) AS last_reason,
    ( SELECT d.confidence
           FROM public.ai_global_decisions d
          WHERE ((d.component)::text = (p.component)::text)
          ORDER BY d.decided_at DESC
         LIMIT 1) AS decision_confidence
   FROM public.sys_control_policies p
  ORDER BY component;


ALTER VIEW public.v_global_control_dashboard OWNER TO postgres;

--
-- TOC entry 569 (class 1259 OID 21916)
-- Name: v_global_model_history; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_global_model_history AS
 SELECT model_id,
    model_name,
    version_no,
    accuracy,
    loss,
    aggregated_from,
    created_at
   FROM public.ai_global_model_registry
  ORDER BY version_no DESC;


ALTER VIEW public.v_global_model_history OWNER TO postgres;

--
-- TOC entry 636 (class 1259 OID 22560)
-- Name: v_governance_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_governance_dashboard AS
 SELECT snapshot_time,
    cpu_load,
    memory_gb,
    active_alerts,
    unresolved_escalations,
    avg_margin,
    avg_cost,
    avg_revenue,
    ai_accuracy,
    ai_confidence,
    audit_events,
    governance_score,
        CASE
            WHEN (governance_score >= (180)::numeric) THEN 'excellent'::text
            WHEN (governance_score >= (130)::numeric) THEN 'healthy'::text
            WHEN (governance_score >= (90)::numeric) THEN 'attention'::text
            ELSE 'critical'::text
        END AS system_state
   FROM public.sys_ops_governance
  ORDER BY snapshot_time DESC;


ALTER VIEW public.v_governance_dashboard OWNER TO postgres;

--
-- TOC entry 383 (class 1259 OID 19559)
-- Name: v_integrity_details; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_integrity_details AS
 SELECT 'orders_missing_user'::text AS issue,
    o.order_id,
    o.created_at
   FROM public.orders o
  WHERE ((o.user_id IS NULL) OR (NOT (EXISTS ( SELECT 1
           FROM public.users u
          WHERE (u.user_id = o.user_id)))))
UNION ALL
 SELECT 'payments_orphaned'::text AS issue,
    p.payment_id AS order_id,
    p.created_at
   FROM public.payments p
  WHERE ((p.order_id IS NULL) OR (NOT (EXISTS ( SELECT 1
           FROM public.orders o
          WHERE (o.order_id = p.order_id)))))
UNION ALL
 SELECT 'refunds_orphaned'::text AS issue,
    r.refund_id AS order_id,
    r.created_at
   FROM public.refunds r
  WHERE ((r.payment_id IS NULL) OR (NOT (EXISTS ( SELECT 1
           FROM public.payments p
          WHERE (p.payment_id = r.payment_id)))))
UNION ALL
 SELECT 'deliveries_orphaned'::text AS issue,
    d.delivery_id AS order_id,
    d.created_at
   FROM public.deliveries d
  WHERE ((d.order_id IS NULL) OR (NOT (EXISTS ( SELECT 1
           FROM public.orders o
          WHERE (o.order_id = d.order_id)))));


ALTER VIEW public.v_integrity_details OWNER TO postgres;

--
-- TOC entry 6367 (class 0 OID 0)
-- Dependencies: 383
-- Name: VIEW v_integrity_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW public.v_integrity_details IS 'Detailed list of orphaned or inconsistent records for inspection.';


--
-- TOC entry 509 (class 1259 OID 21526)
-- Name: v_inventory_risk_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_inventory_risk_summary AS
 SELECT i.product_id,
    p.product_name,
    i.forecast_date,
    i.current_stock,
    i.predicted_stock,
    i.days_to_stockout,
    i.reorder_recommendation
   FROM (public.ai_inventory_forecasts i
     JOIN public.products p ON ((i.product_id = p.product_id)))
  ORDER BY i.forecast_date DESC, i.days_to_stockout;


ALTER VIEW public.v_inventory_risk_summary OWNER TO postgres;

--
-- TOC entry 437 (class 1259 OID 20917)
-- Name: v_kpi_anomalies_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_anomalies_recent AS
 SELECT flag_id,
    snapshot_date,
    tenant_id,
    kpi_name,
    kpi_value,
    mean_30d,
    stddev_30d,
    z_score,
    severity,
    created_at
   FROM public.kpi_anomaly_flags
  WHERE (snapshot_date >= ((now())::date - 30))
  ORDER BY snapshot_date DESC, severity DESC;


ALTER VIEW public.v_kpi_anomalies_recent OWNER TO postgres;

--
-- TOC entry 447 (class 1259 OID 20977)
-- Name: v_kpi_correlation_matrix; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_correlation_matrix AS
 SELECT tenant_id,
    kpi_x,
    kpi_y,
    correlation
   FROM public.kpi_correlations
  ORDER BY tenant_id, kpi_x, kpi_y;


ALTER VIEW public.v_kpi_correlation_matrix OWNER TO postgres;

--
-- TOC entry 448 (class 1259 OID 20981)
-- Name: v_kpi_explainability_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_explainability_recent AS
 SELECT explain_id,
    snapshot_date,
    tenant_id,
    kpi_name,
    observed_value,
    expected_value,
    deviation_pct,
    z_score,
    severity,
    reason_summary,
    related_kpi,
    correlation,
    created_at
   FROM public.kpi_explainability_logs
  WHERE (snapshot_date >= ((now())::date - 30))
  ORDER BY snapshot_date DESC, severity DESC;


ALTER VIEW public.v_kpi_explainability_recent OWNER TO postgres;

--
-- TOC entry 441 (class 1259 OID 20944)
-- Name: v_kpi_forecast_next_14d; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_forecast_next_14d AS
 SELECT forecast_date,
    tenant_id,
    kpi_name,
    forecast_value,
    lower_band,
    upper_band,
    method,
    created_at
   FROM public.kpi_forecast
  WHERE ((forecast_date >= (now())::date) AND (forecast_date <= ((now())::date + 14)))
  ORDER BY forecast_date, tenant_id NULLS FIRST, kpi_name;


ALTER VIEW public.v_kpi_forecast_next_14d OWNER TO postgres;

--
-- TOC entry 436 (class 1259 OID 20913)
-- Name: v_kpi_latest_30d; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_latest_30d AS
 SELECT snapshot_date,
    tenant_id,
    total_orders,
    total_revenue,
    total_refunds,
    net_revenue,
    new_users,
    purchasers,
    repeat_customers,
    repeat_rate,
    aov,
    created_at
   FROM public.kpi_daily_snapshot
  WHERE (snapshot_date >= ((now())::date - 30))
  ORDER BY snapshot_date DESC, tenant_id NULLS FIRST;


ALTER VIEW public.v_kpi_latest_30d OWNER TO postgres;

--
-- TOC entry 442 (class 1259 OID 20948)
-- Name: v_kpi_thresholds; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_thresholds AS
 SELECT tenant_id,
    kpi_name,
    mean_30d,
    stddev_30d,
    lower_alert,
    upper_alert,
    z_used,
    updated_at
   FROM public.kpi_thresholds;


ALTER VIEW public.v_kpi_thresholds OWNER TO postgres;

--
-- TOC entry 440 (class 1259 OID 20936)
-- Name: v_kpi_unpivot; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_kpi_unpivot AS
 SELECT kpi_daily_snapshot.tenant_id,
    kpi_daily_snapshot.snapshot_date,
    'total_orders'::character varying(100) AS kpi_name,
    (kpi_daily_snapshot.total_orders)::numeric(18,4) AS kpi_value
   FROM public.kpi_daily_snapshot
UNION ALL
 SELECT kpi_daily_snapshot.tenant_id,
    kpi_daily_snapshot.snapshot_date,
    'total_revenue'::character varying AS kpi_name,
    (kpi_daily_snapshot.total_revenue)::numeric(18,4) AS kpi_value
   FROM public.kpi_daily_snapshot
UNION ALL
 SELECT kpi_daily_snapshot.tenant_id,
    kpi_daily_snapshot.snapshot_date,
    'net_revenue'::character varying AS kpi_name,
    (kpi_daily_snapshot.net_revenue)::numeric(18,4) AS kpi_value
   FROM public.kpi_daily_snapshot
UNION ALL
 SELECT kpi_daily_snapshot.tenant_id,
    kpi_daily_snapshot.snapshot_date,
    'aov'::character varying AS kpi_name,
    (kpi_daily_snapshot.aov)::numeric(18,4) AS kpi_value
   FROM public.kpi_daily_snapshot
UNION ALL
 SELECT kpi_daily_snapshot.tenant_id,
    kpi_daily_snapshot.snapshot_date,
    'repeat_rate'::character varying AS kpi_name,
    (kpi_daily_snapshot.repeat_rate)::numeric(18,4) AS kpi_value
   FROM public.kpi_daily_snapshot;


ALTER VIEW public.v_kpi_unpivot OWNER TO postgres;

--
-- TOC entry 544 (class 1259 OID 21756)
-- Name: v_market_intelligence_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_market_intelligence_dashboard AS
 SELECT category,
    indicator_name,
    round(avg(indicator_value), 2) AS avg_value,
    round(avg(indicator_change), 2) AS avg_change,
    count(*) AS records,
    max(collected_at) AS last_update
   FROM public.ai_market_trends t
  GROUP BY category, indicator_name
  ORDER BY (max(collected_at)) DESC;


ALTER VIEW public.v_market_intelligence_dashboard OWNER TO postgres;

--
-- TOC entry 517 (class 1259 OID 21571)
-- Name: v_model_accuracy_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_model_accuracy_summary AS
 SELECT tenant_id,
    model_type,
    round(avg(avg_reward), 4) AS avg_reward,
    round(avg(avg_accuracy), 4) AS avg_accuracy,
    sum(samples) AS total_samples,
    max(updated_at) AS last_updated
   FROM public.ai_model_performance
  GROUP BY tenant_id, model_type
  ORDER BY (max(updated_at)) DESC;


ALTER VIEW public.v_model_accuracy_summary OWNER TO postgres;

--
-- TOC entry 576 (class 1259 OID 21960)
-- Name: v_model_explainability_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_model_explainability_recent AS
 SELECT created_at,
    tenant_id,
    model_type,
    decision_id,
    reference_id,
    confidence,
    explanation,
    feature_importance
   FROM public.ai_explainability_logs l
  ORDER BY created_at DESC;


ALTER VIEW public.v_model_explainability_recent OWNER TO postgres;

--
-- TOC entry 508 (class 1259 OID 21521)
-- Name: v_optimal_pricing_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_optimal_pricing_dashboard AS
 SELECT p.product_id,
    p.product_name,
    f.forecast_date,
    f.current_price,
    f.optimal_price,
    f.expected_demand,
    f.expected_revenue,
    f.elasticity_score,
    f.confidence
   FROM (public.ai_price_forecasts f
     JOIN public.products p ON ((f.product_id = p.product_id)))
  ORDER BY f.forecast_date DESC, f.expected_revenue DESC;


ALTER VIEW public.v_optimal_pricing_dashboard OWNER TO postgres;

--
-- TOC entry 377 (class 1259 OID 19380)
-- Name: v_order_totals; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_order_totals AS
 SELECT o.order_id,
    sum(oi.subtotal) AS total
   FROM (public.orders o
     JOIN public.order_items oi ON ((o.order_id = oi.order_id)))
  GROUP BY o.order_id;


ALTER VIEW public.v_order_totals OWNER TO postgres;

--
-- TOC entry 598 (class 1259 OID 22207)
-- Name: v_personalized_recommendations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_personalized_recommendations AS
 SELECT u.user_id,
    pr.product_id,
    pr.similarity,
    p.product_name,
    p.price,
    now() AS recommended_at
   FROM ((public.users u
     CROSS JOIN LATERAL public.fn_recommend_products_for_user(u.user_id, 5) pr(product_id, similarity))
     JOIN public.products p ON ((p.product_id = pr.product_id)))
  ORDER BY u.user_id, pr.similarity DESC;


ALTER VIEW public.v_personalized_recommendations OWNER TO postgres;

--
-- TOC entry 503 (class 1259 OID 21442)
-- Name: v_policy_audit_trail; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_policy_audit_trail AS
 SELECT tenant_id,
    rule_name,
    rule_type,
    rule_definition,
    created_at
   FROM public.ai_policy_rules
  ORDER BY created_at DESC;


ALTER VIEW public.v_policy_audit_trail OWNER TO postgres;

--
-- TOC entry 525 (class 1259 OID 21626)
-- Name: v_policy_effectiveness; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_policy_effectiveness AS
 SELECT p.policy_id,
    p.policy_name,
    p.policy_type,
    count(e.decision_id) AS total_actions,
    round(avg(e.actual_reward), 4) AS avg_reward,
    round(avg(e.confidence), 2) AS avg_confidence,
    max(e.executed_at) AS last_action
   FROM (public.ai_decision_policies p
     LEFT JOIN public.ai_decision_events e ON ((e.policy_id = p.policy_id)))
  GROUP BY p.policy_id, p.policy_name, p.policy_type;


ALTER VIEW public.v_policy_effectiveness OWNER TO postgres;

--
-- TOC entry 553 (class 1259 OID 21814)
-- Name: v_policy_resilience_matrix; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_policy_resilience_matrix AS
 SELECT p.tenant_id,
    p.policy_name,
    round(avg(r.delta_percent), 2) AS avg_delta,
    round(stddev_pop(r.delta_percent), 2) AS volatility,
        CASE
            WHEN (avg(r.delta_percent) > (0)::numeric) THEN 'Resilient'::text
            ELSE 'Vulnerable'::text
        END AS resilience_status
   FROM ((public.ai_decision_policies p
     JOIN public.ai_simulation_runs s ON ((s.tenant_id = p.tenant_id)))
     JOIN public.ai_simulation_results r ON ((r.run_id = s.run_id)))
  GROUP BY p.tenant_id, p.policy_name;


ALTER VIEW public.v_policy_resilience_matrix OWNER TO postgres;

--
-- TOC entry 381 (class 1259 OID 19549)
-- Name: v_product_stock; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_product_stock AS
 SELECT p.product_id,
    p.product_name,
    COALESCE(sum(st.change_qty), (0)::bigint) AS current_stock
   FROM (public.products p
     LEFT JOIN public.stock_transactions st ON ((p.product_id = st.product_id)))
  GROUP BY p.product_id, p.product_name;


ALTER VIEW public.v_product_stock OWNER TO postgres;

--
-- TOC entry 476 (class 1259 OID 21265)
-- Name: v_retention_actions_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_retention_actions_recent AS
 SELECT action_id,
    user_id,
    tenant_id,
    action_type,
    description,
    priority,
    status,
    created_at,
    completed_at
   FROM public.ai_retention_actions
  WHERE (created_at >= (now() - '7 days'::interval))
  ORDER BY created_at DESC;


ALTER VIEW public.v_retention_actions_recent OWNER TO postgres;

--
-- TOC entry 633 (class 1259 OID 22544)
-- Name: v_revenue_protection_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_revenue_protection_summary AS
 SELECT COALESCE(rpa.tenant_id, c.tenant_id) AS tenant_id,
    c.forecast_date,
    c.revenue AS forecast_revenue,
    (c.infra_cost + c.ai_cost) AS forecast_cost,
    c.margin AS forecast_margin,
    rpa.action_type,
    rpa.decision_reason,
    rpa.executed_at
   FROM (public.ai_cost_forecasts c
     LEFT JOIN LATERAL ( SELECT r.tenant_id,
            r.action_type,
            r.decision_reason,
            r.executed_at
           FROM public.ai_revenue_protection_actions r
          WHERE (r.tenant_id = c.tenant_id)
          ORDER BY r.executed_at DESC
         LIMIT 1) rpa ON (true))
  ORDER BY c.forecast_date DESC NULLS LAST;


ALTER VIEW public.v_revenue_protection_summary OWNER TO postgres;

--
-- TOC entry 516 (class 1259 OID 21567)
-- Name: v_rl_policy_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_rl_policy_dashboard AS
 SELECT tenant_id,
    model_type,
    weight_demand,
    weight_margin,
    weight_accuracy,
    learning_rate,
    last_updated
   FROM public.ai_rl_policy_weights
  ORDER BY tenant_id, model_type;


ALTER VIEW public.v_rl_policy_dashboard OWNER TO postgres;

--
-- TOC entry 552 (class 1259 OID 21809)
-- Name: v_simulation_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_simulation_summary AS
 SELECT s.run_id,
    sc.scenario_name,
    sc.scenario_type,
    s.status,
    s.start_time,
    s.end_time,
    count(r.result_id) AS results_count,
    round(avg(r.delta_percent), 2) AS avg_impact_pct
   FROM ((public.ai_simulation_runs s
     JOIN public.ai_scenario_library sc ON ((s.scenario_id = sc.scenario_id)))
     LEFT JOIN public.ai_simulation_results r ON ((s.run_id = r.run_id)))
  GROUP BY s.run_id, sc.scenario_name, sc.scenario_type, s.status, s.start_time, s.end_time
  ORDER BY s.run_id DESC;


ALTER VIEW public.v_simulation_summary OWNER TO postgres;

--
-- TOC entry 502 (class 1259 OID 21438)
-- Name: v_sla_status_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_sla_status_dashboard AS
 SELECT tenant_id,
    job_name,
    avg_latency_ms,
    success_rate,
    total_runs,
    failures,
    ((success_rate < (95)::numeric) OR (avg_latency_ms > sla_target_ms)) AS sla_breach
   FROM public.ai_sla_monitoring
  ORDER BY updated_at DESC;


ALTER VIEW public.v_sla_status_dashboard OWNER TO postgres;

--
-- TOC entry 560 (class 1259 OID 21857)
-- Name: v_strategy_evolution_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_strategy_evolution_summary AS
 SELECT s.tenant_id,
    s.strategy_id,
    s.strategy_name,
    s.generation_no,
    s.performance_score,
    s.reward_avg,
    s.confidence_avg,
    s.volatility,
    s.is_active,
    h.mutation_factor,
    h.improvement_pct,
    h.created_at AS evolved_at
   FROM (public.ai_strategy_versions s
     LEFT JOIN public.ai_strategy_evolution_history h ON ((s.strategy_id = h.child_strategy_id)))
  ORDER BY s.tenant_id, s.generation_no DESC;


ALTER VIEW public.v_strategy_evolution_summary OWNER TO postgres;

--
-- TOC entry 617 (class 1259 OID 22444)
-- Name: v_system_autoscale_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_system_autoscale_summary AS
 SELECT p.forecast_time,
    p.predicted_orders,
    p.predicted_revenue,
    p.predicted_cpu_load,
    p.predicted_memory_gb,
    a.action_type,
    a.target_component,
    a.decision_reason,
    a.executed,
    a.created_at AS action_created_at
   FROM (public.ai_scaling_predictions p
     LEFT JOIN LATERAL ( SELECT ai_resource_actions.action_type,
            ai_resource_actions.target_component,
            ai_resource_actions.decision_reason,
            ai_resource_actions.executed,
            ai_resource_actions.created_at
           FROM public.ai_resource_actions
          ORDER BY ai_resource_actions.created_at DESC
         LIMIT 1) a ON (true))
  ORDER BY p.created_at DESC;


ALTER VIEW public.v_system_autoscale_summary OWNER TO postgres;

--
-- TOC entry 597 (class 1259 OID 22154)
-- Name: v_system_health_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_system_health_dashboard AS
 SELECT event_id,
    event_type,
    severity,
    details,
    detected_at,
    resolved_at,
    resolution_action
   FROM public.sys_health_events
  ORDER BY detected_at DESC;


ALTER VIEW public.v_system_health_dashboard OWNER TO postgres;

--
-- TOC entry 622 (class 1259 OID 22476)
-- Name: v_tenant_efficiency_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_tenant_efficiency_dashboard AS
 SELECT i.tenant_id,
    i.avg_revenue,
    i.avg_cost,
    i.profit_margin,
    i.efficiency_score,
    i.detected_anomaly,
    c.forecast_date,
    c.revenue AS forecast_revenue,
    (c.infra_cost + c.ai_cost) AS forecast_cost,
    c.margin AS forecast_margin,
    c.confidence
   FROM (public.ai_profitability_insights i
     LEFT JOIN public.ai_cost_forecasts c USING (tenant_id))
  ORDER BY i.tenant_id, c.forecast_date DESC;


ALTER VIEW public.v_tenant_efficiency_dashboard OWNER TO postgres;

--
-- TOC entry 492 (class 1259 OID 21376)
-- Name: v_tenant_storage_usage; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_tenant_storage_usage AS
 SELECT t.tenant_id,
    t.tenant_name,
    count(DISTINCT u.user_id) AS total_users,
    count(DISTINCT o.order_id) AS total_orders,
    sum(p.amount) AS total_revenue,
    t.data_retention_days,
    t.sla_tier,
    t.created_at,
    t.updated_at
   FROM (((public.tenant_policies t
     LEFT JOIN public.users u ON ((t.tenant_id = u.tenant_id)))
     LEFT JOIN public.orders o ON ((t.tenant_id = o.tenant_id)))
     LEFT JOIN public.payments p ON ((o.order_id = p.order_id)))
  GROUP BY t.tenant_id, t.tenant_name, t.sla_tier, t.data_retention_days, t.created_at, t.updated_at;


ALTER VIEW public.v_tenant_storage_usage OWNER TO postgres;

--
-- TOC entry 485 (class 1259 OID 21331)
-- Name: v_uplift_summary_recent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_uplift_summary_recent AS
 SELECT action_type,
    churn_risk,
    attempts,
    conversions,
    conversion_rate,
    avg_revenue,
    window_days,
    calculated_at
   FROM public.ai_uplift_metrics
  WHERE (calculated_at >= (now() - '7 days'::interval))
  ORDER BY calculated_at DESC, action_type, churn_risk;


ALTER VIEW public.v_uplift_summary_recent OWNER TO postgres;

--
-- TOC entry 594 (class 1259 OID 22133)
-- Name: v_webhook_health_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_webhook_health_dashboard AS
 SELECT w.webhook_id,
    w.name,
    w.target_url,
    h.success_rate,
    h.avg_latency_ms,
    h.confidence_score,
    h.status,
    h.consecutive_failures,
    h.last_evaluation
   FROM (public.rt_webhook_endpoints w
     LEFT JOIN public.ai_webhook_health h ON ((h.webhook_id = w.webhook_id)))
  ORDER BY h.status DESC, h.confidence_score DESC;


ALTER VIEW public.v_webhook_health_dashboard OWNER TO postgres;

--
-- TOC entry 592 (class 1259 OID 22106)
-- Name: v_webhook_status; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_webhook_status AS
 SELECT w.webhook_id,
    w.name,
    count(d.delivery_id) AS total_deliveries,
    sum(
        CASE
            WHEN ((d.status)::text = 'success'::text) THEN 1
            ELSE 0
        END) AS successes,
    sum(
        CASE
            WHEN ((d.status)::text = 'failed'::text) THEN 1
            ELSE 0
        END) AS failures,
    round(((100.0 * (sum(
        CASE
            WHEN ((d.status)::text = 'success'::text) THEN 1
            ELSE 0
        END))::numeric) / (NULLIF(count(*), 0))::numeric), 2) AS success_rate,
    max(d.last_attempt) AS last_attempt
   FROM (public.rt_webhook_endpoints w
     LEFT JOIN public.rt_webhook_deliveries d ON ((w.webhook_id = d.webhook_id)))
  GROUP BY w.webhook_id, w.name;


ALTER VIEW public.v_webhook_status OWNER TO postgres;

--
-- TOC entry 390 (class 1259 OID 19626)
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    warehouse_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    contact_person character varying(255),
    contact_phone character varying(50),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- TOC entry 389 (class 1259 OID 19625)
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_warehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 6368 (class 0 OID 0)
-- Dependencies: 389
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_warehouse_id_seq OWNED BY public.warehouses.warehouse_id;


--
-- TOC entry 4890 (class 2604 OID 20839)
-- Name: ab_experiments experiment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_experiments ALTER COLUMN experiment_id SET DEFAULT nextval('public.ab_experiments_experiment_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 17721)
-- Name: admin_reports report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_reports ALTER COLUMN report_id SET DEFAULT nextval('public.admin_reports_report_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 17709)
-- Name: admin_tasks task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tasks ALTER COLUMN task_id SET DEFAULT nextval('public.admin_tasks_task_id_seq'::regclass);


--
-- TOC entry 5032 (class 2604 OID 21684)
-- Name: ai_agent_agreements agreement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_agreements ALTER COLUMN agreement_id SET DEFAULT nextval('public.ai_agent_agreements_agreement_id_seq'::regclass);


--
-- TOC entry 5027 (class 2604 OID 21647)
-- Name: ai_agent_messages message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_messages ALTER COLUMN message_id SET DEFAULT nextval('public.ai_agent_messages_message_id_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 21668)
-- Name: ai_agent_negotiations negotiation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_negotiations ALTER COLUMN negotiation_id SET DEFAULT nextval('public.ai_agent_negotiations_negotiation_id_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 21635)
-- Name: ai_agent_registry agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_registry ALTER COLUMN agent_id SET DEFAULT nextval('public.ai_agent_registry_agent_id_seq'::regclass);


--
-- TOC entry 5160 (class 2604 OID 22515)
-- Name: ai_alert_escalations escalation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_alert_escalations ALTER COLUMN escalation_id SET DEFAULT nextval('public.ai_alert_escalations_escalation_id_seq'::regclass);


--
-- TOC entry 5074 (class 2604 OID 21941)
-- Name: ai_bias_audit_results audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_bias_audit_results ALTER COLUMN audit_id SET DEFAULT nextval('public.ai_bias_audit_results_audit_id_seq'::regclass);


--
-- TOC entry 5151 (class 2604 OID 22485)
-- Name: ai_budget_alerts alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_budget_alerts ALTER COLUMN alert_id SET DEFAULT nextval('public.ai_budget_alerts_alert_id_seq'::regclass);


--
-- TOC entry 5155 (class 2604 OID 22497)
-- Name: ai_budget_optimizer optimizer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_budget_optimizer ALTER COLUMN optimizer_id SET DEFAULT nextval('public.ai_budget_optimizer_optimizer_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 21277)
-- Name: ai_campaign_outcomes outcome_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_outcomes ALTER COLUMN outcome_id SET DEFAULT nextval('public.ai_campaign_outcomes_outcome_id_seq'::regclass);


--
-- TOC entry 5110 (class 2604 OID 22228)
-- Name: ai_campaigns campaign_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaigns ALTER COLUMN campaign_id SET DEFAULT nextval('public.ai_campaigns_campaign_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 21252)
-- Name: ai_churn_model_metrics metric_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_model_metrics ALTER COLUMN metric_id SET DEFAULT nextval('public.ai_churn_model_metrics_metric_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 21219)
-- Name: ai_churn_predictions churn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_predictions ALTER COLUMN churn_id SET DEFAULT nextval('public.ai_churn_predictions_churn_id_seq'::regclass);


--
-- TOC entry 5043 (class 2604 OID 21747)
-- Name: ai_competitor_prices competitor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_competitor_prices ALTER COLUMN competitor_id SET DEFAULT nextval('public.ai_competitor_prices_competitor_id_seq'::regclass);


--
-- TOC entry 4975 (class 2604 OID 21395)
-- Name: ai_compliance_alerts alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_compliance_alerts ALTER COLUMN alert_id SET DEFAULT nextval('public.ai_compliance_alerts_alert_id_seq'::regclass);


--
-- TOC entry 5139 (class 2604 OID 22454)
-- Name: ai_cost_forecasts forecast_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_cost_forecasts ALTER COLUMN forecast_id SET DEFAULT nextval('public.ai_cost_forecasts_forecast_id_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 21198)
-- Name: ai_customer_profiles profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_customer_profiles ALTER COLUMN profile_id SET DEFAULT nextval('public.ai_customer_profiles_profile_id_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 21593)
-- Name: ai_decision_events decision_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_events ALTER COLUMN decision_id SET DEFAULT nextval('public.ai_decision_events_decision_id_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 21609)
-- Name: ai_decision_outcomes outcome_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_outcomes ALTER COLUMN outcome_id SET DEFAULT nextval('public.ai_decision_outcomes_outcome_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 21580)
-- Name: ai_decision_policies policy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_policies ALTER COLUMN policy_id SET DEFAULT nextval('public.ai_decision_policies_policy_id_seq'::regclass);


--
-- TOC entry 5072 (class 2604 OID 21925)
-- Name: ai_explainability_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_explainability_logs ALTER COLUMN log_id SET DEFAULT nextval('public.ai_explainability_logs_log_id_seq'::regclass);


--
-- TOC entry 5076 (class 2604 OID 21952)
-- Name: ai_fairness_scores score_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_fairness_scores ALTER COLUMN score_id SET DEFAULT nextval('public.ai_fairness_scores_score_id_seq'::regclass);


--
-- TOC entry 5066 (class 2604 OID 21881)
-- Name: ai_federated_rounds round_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_rounds ALTER COLUMN round_id SET DEFAULT nextval('public.ai_federated_rounds_round_id_seq'::regclass);


--
-- TOC entry 5070 (class 2604 OID 21896)
-- Name: ai_federated_updates update_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_updates ALTER COLUMN update_id SET DEFAULT nextval('public.ai_federated_updates_update_id_seq'::regclass);


--
-- TOC entry 5194 (class 2604 OID 22692)
-- Name: ai_global_decisions decision_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_global_decisions ALTER COLUMN decision_id SET DEFAULT nextval('public.ai_global_decisions_decision_id_seq'::regclass);


--
-- TOC entry 5063 (class 2604 OID 21870)
-- Name: ai_global_model_registry model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_global_model_registry ALTER COLUMN model_id SET DEFAULT nextval('public.ai_global_model_registry_model_id_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 21087)
-- Name: ai_insight_trends trend_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_insight_trends ALTER COLUMN trend_id SET DEFAULT nextval('public.ai_insight_trends_trend_id_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 21510)
-- Name: ai_inventory_forecasts inv_forecast_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_inventory_forecasts ALTER COLUMN inv_forecast_id SET DEFAULT nextval('public.ai_inventory_forecasts_inv_forecast_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 21319)
-- Name: ai_learning_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_learning_events ALTER COLUMN event_id SET DEFAULT nextval('public.ai_learning_events_event_id_seq'::regclass);


--
-- TOC entry 5035 (class 2604 OID 21712)
-- Name: ai_market_sources source_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_market_sources ALTER COLUMN source_id SET DEFAULT nextval('public.ai_market_sources_source_id_seq'::regclass);


--
-- TOC entry 5039 (class 2604 OID 21724)
-- Name: ai_market_trends trend_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_market_trends ALTER COLUMN trend_id SET DEFAULT nextval('public.ai_market_trends_trend_id_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 21115)
-- Name: ai_marketing_insights insight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_marketing_insights ALTER COLUMN insight_id SET DEFAULT nextval('public.ai_marketing_insights_insight_id_seq'::regclass);


--
-- TOC entry 5108 (class 2604 OID 22216)
-- Name: ai_marketing_segments segment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_marketing_segments ALTER COLUMN segment_id SET DEFAULT nextval('public.ai_marketing_segments_segment_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 21558)
-- Name: ai_model_performance perf_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_model_performance ALTER COLUMN perf_id SET DEFAULT nextval('public.ai_model_performance_perf_id_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 21408)
-- Name: ai_policy_rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_policy_rules ALTER COLUMN rule_id SET DEFAULT nextval('public.ai_policy_rules_rule_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 21495)
-- Name: ai_price_forecasts forecast_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_price_forecasts ALTER COLUMN forecast_id SET DEFAULT nextval('public.ai_price_forecasts_forecast_id_seq'::regclass);


--
-- TOC entry 5148 (class 2604 OID 22469)
-- Name: ai_profitability_insights insight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_profitability_insights ALTER COLUMN insight_id SET DEFAULT nextval('public.ai_profitability_insights_insight_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 21096)
-- Name: ai_recommendations rec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_recommendations ALTER COLUMN rec_id SET DEFAULT nextval('public.ai_recommendations_rec_id_seq'::regclass);


--
-- TOC entry 5135 (class 2604 OID 22434)
-- Name: ai_resource_actions action_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_resource_actions ALTER COLUMN action_id SET DEFAULT nextval('public.ai_resource_actions_action_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 21235)
-- Name: ai_retention_actions action_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_retention_actions ALTER COLUMN action_id SET DEFAULT nextval('public.ai_retention_actions_action_id_seq'::regclass);


--
-- TOC entry 5165 (class 2604 OID 22529)
-- Name: ai_revenue_protection_actions action_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_revenue_protection_actions ALTER COLUMN action_id SET DEFAULT nextval('public.ai_revenue_protection_actions_action_id_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 21536)
-- Name: ai_rl_feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_rl_feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.ai_rl_feedback_feedback_id_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 21545)
-- Name: ai_rl_policy_weights policy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_rl_policy_weights ALTER COLUMN policy_id SET DEFAULT nextval('public.ai_rl_policy_weights_policy_id_seq'::regclass);


--
-- TOC entry 5131 (class 2604 OID 22424)
-- Name: ai_scaling_predictions prediction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_scaling_predictions ALTER COLUMN prediction_id SET DEFAULT nextval('public.ai_scaling_predictions_prediction_id_seq'::regclass);


--
-- TOC entry 5046 (class 2604 OID 21768)
-- Name: ai_scenario_library scenario_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_scenario_library ALTER COLUMN scenario_id SET DEFAULT nextval('public.ai_scenario_library_scenario_id_seq'::regclass);


--
-- TOC entry 5041 (class 2604 OID 21737)
-- Name: ai_sentiment_signals sentiment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_sentiment_signals ALTER COLUMN sentiment_id SET DEFAULT nextval('public.ai_sentiment_signals_sentiment_id_seq'::regclass);


--
-- TOC entry 5052 (class 2604 OID 21795)
-- Name: ai_simulation_results result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_results ALTER COLUMN result_id SET DEFAULT nextval('public.ai_simulation_results_result_id_seq'::regclass);


--
-- TOC entry 5048 (class 2604 OID 21778)
-- Name: ai_simulation_runs run_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_runs ALTER COLUMN run_id SET DEFAULT nextval('public.ai_simulation_runs_run_id_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 21420)
-- Name: ai_sla_monitoring sla_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_sla_monitoring ALTER COLUMN sla_id SET DEFAULT nextval('public.ai_sla_monitoring_sla_id_seq'::regclass);


--
-- TOC entry 5059 (class 2604 OID 21835)
-- Name: ai_strategy_evolution_history evolution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_evolution_history ALTER COLUMN evolution_id SET DEFAULT nextval('public.ai_strategy_evolution_history_evolution_id_seq'::regclass);


--
-- TOC entry 5061 (class 2604 OID 21845)
-- Name: ai_strategy_metrics metric_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_metrics ALTER COLUMN metric_id SET DEFAULT nextval('public.ai_strategy_metrics_metric_id_seq'::regclass);


--
-- TOC entry 5055 (class 2604 OID 21823)
-- Name: ai_strategy_versions strategy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_versions ALTER COLUMN strategy_id SET DEFAULT nextval('public.ai_strategy_versions_strategy_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 21299)
-- Name: ai_uplift_metrics metric_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_uplift_metrics ALTER COLUMN metric_id SET DEFAULT nextval('public.ai_uplift_metrics_metric_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 21004)
-- Name: alert_queue alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_queue ALTER COLUMN alert_id SET DEFAULT nextval('public.alert_queue_alert_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 20989)
-- Name: alert_rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_rules ALTER COLUMN rule_id SET DEFAULT nextval('public.alert_rules_rule_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 17798)
-- Name: api_keys api_key_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys ALTER COLUMN api_key_id SET DEFAULT nextval('public.api_keys_api_key_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 17810)
-- Name: api_logs api_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs ALTER COLUMN api_log_id SET DEFAULT nextval('public.api_logs_api_log_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 19982)
-- Name: api_tokens token_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tokens ALTER COLUMN token_id SET DEFAULT nextval('public.api_tokens_token_id_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 21355)
-- Name: audit_access_logs audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_access_logs ALTER COLUMN audit_id SET DEFAULT nextval('public.audit_access_logs_audit_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 17676)
-- Name: campaigns campaign_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN campaign_id SET DEFAULT nextval('public.campaigns_campaign_id_seq'::regclass);


--
-- TOC entry 4618 (class 2604 OID 19161)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 17756)
-- Name: commission_rates commission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_rates ALTER COLUMN commission_id SET DEFAULT nextval('public.commission_rates_commission_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 17667)
-- Name: coupon_usage usage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usage ALTER COLUMN usage_id SET DEFAULT nextval('public.coupon_usage_usage_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 17831)
-- Name: data_backups backup_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_backups ALTER COLUMN backup_id SET DEFAULT nextval('public.data_backups_backup_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 21366)
-- Name: data_retention_jobs job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_retention_jobs ALTER COLUMN job_id SET DEFAULT nextval('public.data_retention_jobs_job_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17657)
-- Name: delivery_partner_payouts payout_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_payouts ALTER COLUMN payout_id SET DEFAULT nextval('public.delivery_partner_payouts_payout_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 17776)
-- Name: delivery_partner_wallets wallet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_wallets ALTER COLUMN wallet_id SET DEFAULT nextval('public.delivery_partner_wallets_wallet_id_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 17632)
-- Name: delivery_pricing pricing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_pricing ALTER COLUMN pricing_id SET DEFAULT nextval('public.delivery_pricing_pricing_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 17646)
-- Name: delivery_zones zone_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_zones ALTER COLUMN zone_id SET DEFAULT nextval('public.delivery_zones_zone_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 17700)
-- Name: email_subscriptions subscription_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_subscriptions ALTER COLUMN subscription_id SET DEFAULT nextval('public.email_subscriptions_subscription_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 19646)
-- Name: event_queue event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_queue ALTER COLUMN event_id SET DEFAULT nextval('public.event_queue_event_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 17820)
-- Name: gdpr_requests request_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gdpr_requests ALTER COLUMN request_id SET DEFAULT nextval('public.gdpr_requests_request_id_seq'::regclass);


--
-- TOC entry 4812 (class 2604 OID 17850)
-- Name: gift_cards gift_card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards ALTER COLUMN gift_card_id SET DEFAULT nextval('public.gift_cards_gift_card_id_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 17882)
-- Name: integration_webhooks webhook_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integration_webhooks ALTER COLUMN webhook_id SET DEFAULT nextval('public.integration_webhooks_webhook_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 19929)
-- Name: inventory_alerts alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_alerts ALTER COLUMN alert_id SET DEFAULT nextval('public.inventory_alerts_alert_id_seq'::regclass);


--
-- TOC entry 4604 (class 2604 OID 16393)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 20878)
-- Name: job_run_history job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_run_history ALTER COLUMN job_id SET DEFAULT nextval('public.job_run_history_job_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 20905)
-- Name: kpi_anomaly_flags flag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_anomaly_flags ALTER COLUMN flag_id SET DEFAULT nextval('public.kpi_anomaly_flags_flag_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 20967)
-- Name: kpi_correlations corr_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_correlations ALTER COLUMN corr_id SET DEFAULT nextval('public.kpi_correlations_corr_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 20956)
-- Name: kpi_explainability_logs explain_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_explainability_logs ALTER COLUMN explain_id SET DEFAULT nextval('public.kpi_explainability_logs_explain_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 20773)
-- Name: login_failures failure_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_failures ALTER COLUMN failure_id SET DEFAULT nextval('public.login_failures_failure_id_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 17841)
-- Name: loyalty_points loyalty_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loyalty_points ALTER COLUMN loyalty_id SET DEFAULT nextval('public.loyalty_points_loyalty_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 21063)
-- Name: notification_delivery_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_delivery_logs ALTER COLUMN log_id SET DEFAULT nextval('public.notification_delivery_logs_log_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 17688)
-- Name: notification_templates template_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_templates ALTER COLUMN template_id SET DEFAULT nextval('public.notification_templates_template_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 17565)
-- Name: order_invoices invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_invoices ALTER COLUMN invoice_id SET DEFAULT nextval('public.order_invoices_invoice_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 17554)
-- Name: order_status_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs ALTER COLUMN log_id SET DEFAULT nextval('public.order_status_logs_log_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 19708)
-- Name: permissions permission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 17591)
-- Name: product_attributes attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attributes ALTER COLUMN attribute_id SET DEFAULT nextval('public.product_attributes_attribute_id_seq'::regclass);


--
-- TOC entry 4637 (class 2604 OID 19158)
-- Name: product_images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN image_id SET DEFAULT nextval('public.product_images_image_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 17579)
-- Name: product_reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews ALTER COLUMN review_id SET DEFAULT nextval('public.product_reviews_review_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16545)
-- Name: product_tag_map map_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_map ALTER COLUMN map_id SET DEFAULT nextval('public.product_tag_map_map_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 16530)
-- Name: product_tags tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags ALTER COLUMN tag_id SET DEFAULT nextval('public.product_tags_tag_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 19604)
-- Name: product_translations translation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translations ALTER COLUMN translation_id SET DEFAULT nextval('public.product_translations_translation_id_seq'::regclass);


--
-- TOC entry 4641 (class 2604 OID 19145)
-- Name: product_variants variant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants ALTER COLUMN variant_id SET DEFAULT nextval('public.product_variants_variant_id_seq'::regclass);


--
-- TOC entry 4626 (class 2604 OID 19087)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4827 (class 2604 OID 19578)
-- Name: promotions promotion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions ALTER COLUMN promotion_id SET DEFAULT nextval('public.promotions_promotion_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 17787)
-- Name: refund_items refund_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_items ALTER COLUMN refund_item_id SET DEFAULT nextval('public.refund_items_refund_item_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 19670)
-- Name: returns return_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns ALTER COLUMN return_id SET DEFAULT nextval('public.returns_return_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 19946)
-- Name: risk_flags flag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_flags ALTER COLUMN flag_id SET DEFAULT nextval('public.risk_flags_flag_id_seq'::regclass);


--
-- TOC entry 4850 (class 2604 OID 19719)
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 19698)
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- TOC entry 5085 (class 2604 OID 22003)
-- Name: rt_consumers consumer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_consumers ALTER COLUMN consumer_id SET DEFAULT nextval('public.rt_consumers_consumer_id_seq'::regclass);


--
-- TOC entry 5081 (class 2604 OID 21985)
-- Name: rt_event_outbox event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_outbox ALTER COLUMN event_id SET DEFAULT nextval('public.rt_event_outbox_event_id_seq'::regclass);


--
-- TOC entry 5078 (class 2604 OID 21972)
-- Name: rt_event_topics topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_topics ALTER COLUMN topic_id SET DEFAULT nextval('public.rt_event_topics_topic_id_seq'::regclass);


--
-- TOC entry 5093 (class 2604 OID 22072)
-- Name: rt_webhook_deliveries delivery_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_deliveries ALTER COLUMN delivery_id SET DEFAULT nextval('public.rt_webhook_deliveries_delivery_id_seq'::regclass);


--
-- TOC entry 5089 (class 2604 OID 22060)
-- Name: rt_webhook_endpoints webhook_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_endpoints ALTER COLUMN webhook_id SET DEFAULT nextval('public.rt_webhook_endpoints_webhook_id_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 17872)
-- Name: seo_metadata seo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seo_metadata ALTER COLUMN seo_id SET DEFAULT nextval('public.seo_metadata_seo_id_seq'::regclass);


--
-- TOC entry 5199 (class 2604 OID 22718)
-- Name: shop_bots bot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_bots ALTER COLUMN bot_id SET DEFAULT nextval('public.shop_bots_bot_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 19262)
-- Name: shop_wallets wallet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_wallets ALTER COLUMN wallet_id SET DEFAULT nextval('public.shop_wallets_wallet_id_seq'::regclass);


--
-- TOC entry 4606 (class 2604 OID 19034)
-- Name: shops shop_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops ALTER COLUMN shop_id SET DEFAULT nextval('public.shops_shop_id_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 19540)
-- Name: stock_transactions transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.stock_transactions_transaction_id_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 17862)
-- Name: store_credits credit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_credits ALTER COLUMN credit_id SET DEFAULT nextval('public.store_credits_credit_id_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 17620)
-- Name: support_tickets ticket_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_tickets ALTER COLUMN ticket_id SET DEFAULT nextval('public.support_tickets_ticket_id_seq'::regclass);


--
-- TOC entry 5119 (class 2604 OID 22295)
-- Name: sys_audit_log audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_audit_log ALTER COLUMN audit_id SET DEFAULT nextval('public.sys_audit_log_audit_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 22569)
-- Name: sys_compliance_findings finding_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_compliance_findings ALTER COLUMN finding_id SET DEFAULT nextval('public.sys_compliance_findings_finding_id_seq'::regclass);


--
-- TOC entry 5180 (class 2604 OID 22662)
-- Name: sys_control_policies policy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_control_policies ALTER COLUMN policy_id SET DEFAULT nextval('public.sys_control_policies_policy_id_seq'::regclass);


--
-- TOC entry 5105 (class 2604 OID 22144)
-- Name: sys_health_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_health_events ALTER COLUMN event_id SET DEFAULT nextval('public.sys_health_events_event_id_seq'::regclass);


--
-- TOC entry 5121 (class 2604 OID 22339)
-- Name: sys_jobs job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_jobs ALTER COLUMN job_id SET DEFAULT nextval('public.sys_jobs_job_id_seq'::regclass);


--
-- TOC entry 5126 (class 2604 OID 22382)
-- Name: sys_metrics metric_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_metrics ALTER COLUMN metric_id SET DEFAULT nextval('public.sys_metrics_metric_id_seq'::regclass);


--
-- TOC entry 5168 (class 2604 OID 22554)
-- Name: sys_ops_governance record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_ops_governance ALTER COLUMN record_id SET DEFAULT nextval('public.sys_ops_governance_record_id_seq'::regclass);


--
-- TOC entry 5175 (class 2604 OID 22581)
-- Name: sys_self_heal_actions action_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_self_heal_actions ALTER COLUMN action_id SET DEFAULT nextval('public.sys_self_heal_actions_action_id_seq'::regclass);


--
-- TOC entry 5188 (class 2604 OID 22678)
-- Name: sys_telemetry_ingest telemetry_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_telemetry_ingest ALTER COLUMN telemetry_id SET DEFAULT nextval('public.sys_telemetry_ingest_telemetry_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 17731)
-- Name: system_banners banner_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_banners ALTER COLUMN banner_id SET DEFAULT nextval('public.system_banners_banner_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 20706)
-- Name: system_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_events ALTER COLUMN event_id SET DEFAULT nextval('public.system_events_event_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 17743)
-- Name: system_pages page_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_pages ALTER COLUMN page_id SET DEFAULT nextval('public.system_pages_page_id_seq'::regclass);


--
-- TOC entry 4852 (class 2604 OID 19876)
-- Name: tags tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN tag_id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 20728)
-- Name: tenants tenant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants ALTER COLUMN tenant_id SET DEFAULT nextval('public.tenants_tenant_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 17599)
-- Name: user_activity_logs activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity_logs ALTER COLUMN activity_id SET DEFAULT nextval('public.user_activity_logs_activity_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 19738)
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 20757)
-- Name: user_sessions session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions ALTER COLUMN session_id SET DEFAULT nextval('public.user_sessions_session_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 17609)
-- Name: user_verifications verification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications ALTER COLUMN verification_id SET DEFAULT nextval('public.user_verifications_verification_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 19629)
-- Name: warehouses warehouse_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN warehouse_id SET DEFAULT nextval('public.warehouses_warehouse_id_seq'::regclass);


--
-- TOC entry 5569 (class 2606 OID 20853)
-- Name: ab_assignments ab_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_assignments
    ADD CONSTRAINT ab_assignments_pkey PRIMARY KEY (user_id, experiment_id);


--
-- TOC entry 5565 (class 2606 OID 20847)
-- Name: ab_experiments ab_experiments_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_experiments
    ADD CONSTRAINT ab_experiments_key_key UNIQUE (key);


--
-- TOC entry 5567 (class 2606 OID 20845)
-- Name: ab_experiments ab_experiments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_experiments
    ADD CONSTRAINT ab_experiments_pkey PRIMARY KEY (experiment_id);


--
-- TOC entry 5309 (class 2606 OID 16768)
-- Name: admin_login_sessions admin_login_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_login_sessions
    ADD CONSTRAINT admin_login_sessions_pkey PRIMARY KEY (session_id);


--
-- TOC entry 5307 (class 2606 OID 16755)
-- Name: admin_logs admin_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_logs
    ADD CONSTRAINT admin_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5325 (class 2606 OID 16884)
-- Name: admin_notifications admin_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_notifications
    ADD CONSTRAINT admin_notifications_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 5292 (class 2606 OID 16707)
-- Name: admin_permissions admin_permissions_permission_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_permission_key_key UNIQUE (permission_key);


--
-- TOC entry 5294 (class 2606 OID 16705)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (permission_id);


--
-- TOC entry 5431 (class 2606 OID 17726)
-- Name: admin_reports admin_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_reports
    ADD CONSTRAINT admin_reports_pkey PRIMARY KEY (report_id);


--
-- TOC entry 5296 (class 2606 OID 16714)
-- Name: admin_role_permission_map admin_role_permission_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission_map
    ADD CONSTRAINT admin_role_permission_map_pkey PRIMARY KEY (map_id);


--
-- TOC entry 5298 (class 2606 OID 16716)
-- Name: admin_role_permission_map admin_role_permission_map_role_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission_map
    ADD CONSTRAINT admin_role_permission_map_role_id_permission_id_key UNIQUE (role_id, permission_id);


--
-- TOC entry 5288 (class 2606 OID 16695)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5290 (class 2606 OID 16697)
-- Name: admin_roles admin_roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_role_name_key UNIQUE (role_name);


--
-- TOC entry 5429 (class 2606 OID 17716)
-- Name: admin_tasks admin_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tasks
    ADD CONSTRAINT admin_tasks_pkey PRIMARY KEY (task_id);


--
-- TOC entry 5300 (class 2606 OID 16740)
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- TOC entry 5302 (class 2606 OID 16736)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 5304 (class 2606 OID 16738)
-- Name: admins admins_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);


--
-- TOC entry 5673 (class 2606 OID 21690)
-- Name: ai_agent_agreements ai_agent_agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_agreements
    ADD CONSTRAINT ai_agent_agreements_pkey PRIMARY KEY (agreement_id);


--
-- TOC entry 5668 (class 2606 OID 21652)
-- Name: ai_agent_messages ai_agent_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_messages
    ADD CONSTRAINT ai_agent_messages_pkey PRIMARY KEY (message_id);


--
-- TOC entry 5671 (class 2606 OID 21674)
-- Name: ai_agent_negotiations ai_agent_negotiations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_negotiations
    ADD CONSTRAINT ai_agent_negotiations_pkey PRIMARY KEY (negotiation_id);


--
-- TOC entry 5665 (class 2606 OID 21641)
-- Name: ai_agent_registry ai_agent_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_registry
    ADD CONSTRAINT ai_agent_registry_pkey PRIMARY KEY (agent_id);


--
-- TOC entry 5765 (class 2606 OID 22524)
-- Name: ai_alert_escalations ai_alert_escalations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_alert_escalations
    ADD CONSTRAINT ai_alert_escalations_pkey PRIMARY KEY (escalation_id);


--
-- TOC entry 5704 (class 2606 OID 21946)
-- Name: ai_bias_audit_results ai_bias_audit_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_bias_audit_results
    ADD CONSTRAINT ai_bias_audit_results_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5761 (class 2606 OID 22492)
-- Name: ai_budget_alerts ai_budget_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_budget_alerts
    ADD CONSTRAINT ai_budget_alerts_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 5763 (class 2606 OID 22503)
-- Name: ai_budget_optimizer ai_budget_optimizer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_budget_optimizer
    ADD CONSTRAINT ai_budget_optimizer_pkey PRIMARY KEY (optimizer_id);


--
-- TOC entry 5743 (class 2606 OID 22266)
-- Name: ai_campaign_metrics ai_campaign_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_metrics
    ADD CONSTRAINT ai_campaign_metrics_pkey PRIMARY KEY (campaign_id);


--
-- TOC entry 5622 (class 2606 OID 21283)
-- Name: ai_campaign_outcomes ai_campaign_outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_outcomes
    ADD CONSTRAINT ai_campaign_outcomes_pkey PRIMARY KEY (outcome_id);


--
-- TOC entry 5741 (class 2606 OID 22246)
-- Name: ai_campaign_targets ai_campaign_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_targets
    ADD CONSTRAINT ai_campaign_targets_pkey PRIMARY KEY (campaign_id, user_id);


--
-- TOC entry 5739 (class 2606 OID 22235)
-- Name: ai_campaigns ai_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaigns
    ADD CONSTRAINT ai_campaigns_pkey PRIMARY KEY (campaign_id);


--
-- TOC entry 5629 (class 2606 OID 21314)
-- Name: ai_churn_feature_weights ai_churn_feature_weights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_feature_weights
    ADD CONSTRAINT ai_churn_feature_weights_pkey PRIMARY KEY (model_name);


--
-- TOC entry 5620 (class 2606 OID 21257)
-- Name: ai_churn_model_metrics ai_churn_model_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_model_metrics
    ADD CONSTRAINT ai_churn_model_metrics_pkey PRIMARY KEY (metric_id);


--
-- TOC entry 5614 (class 2606 OID 21224)
-- Name: ai_churn_predictions ai_churn_predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_predictions
    ADD CONSTRAINT ai_churn_predictions_pkey PRIMARY KEY (churn_id);


--
-- TOC entry 5681 (class 2606 OID 21751)
-- Name: ai_competitor_prices ai_competitor_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_competitor_prices
    ADD CONSTRAINT ai_competitor_prices_pkey PRIMARY KEY (competitor_id);


--
-- TOC entry 5640 (class 2606 OID 21402)
-- Name: ai_compliance_alerts ai_compliance_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_compliance_alerts
    ADD CONSTRAINT ai_compliance_alerts_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 5757 (class 2606 OID 22464)
-- Name: ai_cost_forecasts ai_cost_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_cost_forecasts
    ADD CONSTRAINT ai_cost_forecasts_pkey PRIMARY KEY (forecast_id);


--
-- TOC entry 5612 (class 2606 OID 21204)
-- Name: ai_customer_profiles ai_customer_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_customer_profiles
    ADD CONSTRAINT ai_customer_profiles_pkey PRIMARY KEY (profile_id);


--
-- TOC entry 5661 (class 2606 OID 21599)
-- Name: ai_decision_events ai_decision_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_events
    ADD CONSTRAINT ai_decision_events_pkey PRIMARY KEY (decision_id);


--
-- TOC entry 5663 (class 2606 OID 21612)
-- Name: ai_decision_outcomes ai_decision_outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_outcomes
    ADD CONSTRAINT ai_decision_outcomes_pkey PRIMARY KEY (outcome_id);


--
-- TOC entry 5659 (class 2606 OID 21588)
-- Name: ai_decision_policies ai_decision_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_policies
    ADD CONSTRAINT ai_decision_policies_pkey PRIMARY KEY (policy_id);


--
-- TOC entry 5701 (class 2606 OID 21930)
-- Name: ai_explainability_logs ai_explainability_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_explainability_logs
    ADD CONSTRAINT ai_explainability_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5707 (class 2606 OID 21955)
-- Name: ai_fairness_scores ai_fairness_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_fairness_scores
    ADD CONSTRAINT ai_fairness_scores_pkey PRIMARY KEY (score_id);


--
-- TOC entry 5697 (class 2606 OID 21886)
-- Name: ai_federated_rounds ai_federated_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_rounds
    ADD CONSTRAINT ai_federated_rounds_pkey PRIMARY KEY (round_id);


--
-- TOC entry 5699 (class 2606 OID 21901)
-- Name: ai_federated_updates ai_federated_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_updates
    ADD CONSTRAINT ai_federated_updates_pkey PRIMARY KEY (update_id);


--
-- TOC entry 5783 (class 2606 OID 22700)
-- Name: ai_global_decisions ai_global_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_global_decisions
    ADD CONSTRAINT ai_global_decisions_pkey PRIMARY KEY (decision_id);


--
-- TOC entry 5695 (class 2606 OID 21876)
-- Name: ai_global_model_registry ai_global_model_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_global_model_registry
    ADD CONSTRAINT ai_global_model_registry_pkey PRIMARY KEY (model_id);


--
-- TOC entry 5603 (class 2606 OID 21090)
-- Name: ai_insight_trends ai_insight_trends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_insight_trends
    ADD CONSTRAINT ai_insight_trends_pkey PRIMARY KEY (trend_id);


--
-- TOC entry 5649 (class 2606 OID 21515)
-- Name: ai_inventory_forecasts ai_inventory_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_inventory_forecasts
    ADD CONSTRAINT ai_inventory_forecasts_pkey PRIMARY KEY (inv_forecast_id);


--
-- TOC entry 5631 (class 2606 OID 21324)
-- Name: ai_learning_events ai_learning_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_learning_events
    ADD CONSTRAINT ai_learning_events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5675 (class 2606 OID 21719)
-- Name: ai_market_sources ai_market_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_market_sources
    ADD CONSTRAINT ai_market_sources_pkey PRIMARY KEY (source_id);


--
-- TOC entry 5677 (class 2606 OID 21727)
-- Name: ai_market_trends ai_market_trends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_market_trends
    ADD CONSTRAINT ai_market_trends_pkey PRIMARY KEY (trend_id);


--
-- TOC entry 5609 (class 2606 OID 21120)
-- Name: ai_marketing_insights ai_marketing_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_marketing_insights
    ADD CONSTRAINT ai_marketing_insights_pkey PRIMARY KEY (insight_id);


--
-- TOC entry 5735 (class 2606 OID 22221)
-- Name: ai_marketing_segments ai_marketing_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_marketing_segments
    ADD CONSTRAINT ai_marketing_segments_pkey PRIMARY KEY (segment_id);


--
-- TOC entry 5737 (class 2606 OID 22223)
-- Name: ai_marketing_segments ai_marketing_segments_segment_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_marketing_segments
    ADD CONSTRAINT ai_marketing_segments_segment_name_key UNIQUE (segment_name);


--
-- TOC entry 5657 (class 2606 OID 21563)
-- Name: ai_model_performance ai_model_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_model_performance
    ADD CONSTRAINT ai_model_performance_pkey PRIMARY KEY (perf_id);


--
-- TOC entry 5643 (class 2606 OID 21415)
-- Name: ai_policy_rules ai_policy_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_policy_rules
    ADD CONSTRAINT ai_policy_rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 5647 (class 2606 OID 21500)
-- Name: ai_price_forecasts ai_price_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_price_forecasts
    ADD CONSTRAINT ai_price_forecasts_pkey PRIMARY KEY (forecast_id);


--
-- TOC entry 5759 (class 2606 OID 22473)
-- Name: ai_profitability_insights ai_profitability_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_profitability_insights
    ADD CONSTRAINT ai_profitability_insights_pkey PRIMARY KEY (insight_id);


--
-- TOC entry 5606 (class 2606 OID 21099)
-- Name: ai_recommendations ai_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_recommendations
    ADD CONSTRAINT ai_recommendations_pkey PRIMARY KEY (rec_id);


--
-- TOC entry 5755 (class 2606 OID 22441)
-- Name: ai_resource_actions ai_resource_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_resource_actions
    ADD CONSTRAINT ai_resource_actions_pkey PRIMARY KEY (action_id);


--
-- TOC entry 5617 (class 2606 OID 21241)
-- Name: ai_retention_actions ai_retention_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_retention_actions
    ADD CONSTRAINT ai_retention_actions_pkey PRIMARY KEY (action_id);


--
-- TOC entry 5767 (class 2606 OID 22535)
-- Name: ai_revenue_protection_actions ai_revenue_protection_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_revenue_protection_actions
    ADD CONSTRAINT ai_revenue_protection_actions_pkey PRIMARY KEY (action_id);


--
-- TOC entry 5651 (class 2606 OID 21539)
-- Name: ai_rl_feedback ai_rl_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_rl_feedback
    ADD CONSTRAINT ai_rl_feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 5654 (class 2606 OID 21552)
-- Name: ai_rl_policy_weights ai_rl_policy_weights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_rl_policy_weights
    ADD CONSTRAINT ai_rl_policy_weights_pkey PRIMARY KEY (policy_id);


--
-- TOC entry 5753 (class 2606 OID 22429)
-- Name: ai_scaling_predictions ai_scaling_predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_scaling_predictions
    ADD CONSTRAINT ai_scaling_predictions_pkey PRIMARY KEY (prediction_id);


--
-- TOC entry 5683 (class 2606 OID 21773)
-- Name: ai_scenario_library ai_scenario_library_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_scenario_library
    ADD CONSTRAINT ai_scenario_library_pkey PRIMARY KEY (scenario_id);


--
-- TOC entry 5679 (class 2606 OID 21742)
-- Name: ai_sentiment_signals ai_sentiment_signals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_sentiment_signals
    ADD CONSTRAINT ai_sentiment_signals_pkey PRIMARY KEY (sentiment_id);


--
-- TOC entry 5687 (class 2606 OID 21799)
-- Name: ai_simulation_results ai_simulation_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_results
    ADD CONSTRAINT ai_simulation_results_pkey PRIMARY KEY (result_id);


--
-- TOC entry 5685 (class 2606 OID 21785)
-- Name: ai_simulation_runs ai_simulation_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_runs
    ADD CONSTRAINT ai_simulation_runs_pkey PRIMARY KEY (run_id);


--
-- TOC entry 5645 (class 2606 OID 21430)
-- Name: ai_sla_monitoring ai_sla_monitoring_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_sla_monitoring
    ADD CONSTRAINT ai_sla_monitoring_pkey PRIMARY KEY (sla_id);


--
-- TOC entry 5691 (class 2606 OID 21840)
-- Name: ai_strategy_evolution_history ai_strategy_evolution_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_evolution_history
    ADD CONSTRAINT ai_strategy_evolution_history_pkey PRIMARY KEY (evolution_id);


--
-- TOC entry 5693 (class 2606 OID 21848)
-- Name: ai_strategy_metrics ai_strategy_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_metrics
    ADD CONSTRAINT ai_strategy_metrics_pkey PRIMARY KEY (metric_id);


--
-- TOC entry 5689 (class 2606 OID 21830)
-- Name: ai_strategy_versions ai_strategy_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_versions
    ADD CONSTRAINT ai_strategy_versions_pkey PRIMARY KEY (strategy_id);


--
-- TOC entry 5625 (class 2606 OID 21305)
-- Name: ai_uplift_metrics ai_uplift_metrics_action_type_churn_risk_window_days_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_uplift_metrics
    ADD CONSTRAINT ai_uplift_metrics_action_type_churn_risk_window_days_key UNIQUE (action_type, churn_risk, window_days);


--
-- TOC entry 5627 (class 2606 OID 21303)
-- Name: ai_uplift_metrics ai_uplift_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_uplift_metrics
    ADD CONSTRAINT ai_uplift_metrics_pkey PRIMARY KEY (metric_id);


--
-- TOC entry 5731 (class 2606 OID 22125)
-- Name: ai_webhook_health ai_webhook_health_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_webhook_health
    ADD CONSTRAINT ai_webhook_health_pkey PRIMARY KEY (webhook_id);


--
-- TOC entry 5597 (class 2606 OID 21011)
-- Name: alert_queue alert_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_queue
    ADD CONSTRAINT alert_queue_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 5594 (class 2606 OID 20998)
-- Name: alert_rules alert_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_rules
    ADD CONSTRAINT alert_rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 5385 (class 2606 OID 17165)
-- Name: analytics analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics
    ADD CONSTRAINT analytics_pkey PRIMARY KEY (analytics_id);


--
-- TOC entry 5447 (class 2606 OID 17805)
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (api_key_id);


--
-- TOC entry 5449 (class 2606 OID 17815)
-- Name: api_logs api_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT api_logs_pkey PRIMARY KEY (api_log_id);


--
-- TOC entry 5531 (class 2606 OID 19988)
-- Name: api_tokens api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_pkey PRIMARY KEY (token_id);


--
-- TOC entry 5533 (class 2606 OID 19990)
-- Name: api_tokens api_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_token_key UNIQUE (token);


--
-- TOC entry 5635 (class 2606 OID 21360)
-- Name: audit_access_logs audit_access_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_access_logs
    ADD CONSTRAINT audit_access_logs_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5392 (class 2606 OID 17201)
-- Name: audit_trail audit_trail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_trail
    ADD CONSTRAINT audit_trail_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5422 (class 2606 OID 17683)
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id);


--
-- TOC entry 5222 (class 2606 OID 19163)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 5224 (class 2606 OID 16450)
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- TOC entry 5344 (class 2606 OID 16973)
-- Name: chat_rooms chat_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_rooms
    ADD CONSTRAINT chat_rooms_pkey PRIMARY KEY (chat_room_id);


--
-- TOC entry 5439 (class 2606 OID 17760)
-- Name: commission_rates commission_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_rates
    ADD CONSTRAINT commission_rates_pkey PRIMARY KEY (commission_id);


--
-- TOC entry 5420 (class 2606 OID 17671)
-- Name: coupon_usage coupon_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_pkey PRIMARY KEY (usage_id);


--
-- TOC entry 5377 (class 2606 OID 17139)
-- Name: coupons coupons_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_key UNIQUE (code);


--
-- TOC entry 5379 (class 2606 OID 17137)
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (coupon_id);


--
-- TOC entry 5486 (class 2606 OID 19624)
-- Name: currency_rates currency_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency_rates
    ADD CONSTRAINT currency_rates_pkey PRIMARY KEY (currency_code);


--
-- TOC entry 5529 (class 2606 OID 19972)
-- Name: customer_metrics customer_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_metrics
    ADD CONSTRAINT customer_metrics_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5454 (class 2606 OID 17836)
-- Name: data_backups data_backups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_backups
    ADD CONSTRAINT data_backups_pkey PRIMARY KEY (backup_id);


--
-- TOC entry 5638 (class 2606 OID 21372)
-- Name: data_retention_jobs data_retention_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_retention_jobs
    ADD CONSTRAINT data_retention_jobs_pkey PRIMARY KEY (job_id);


--
-- TOC entry 5330 (class 2606 OID 19243)
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


--
-- TOC entry 5332 (class 2606 OID 16915)
-- Name: deliveries deliveries_tracking_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_tracking_number_key UNIQUE (tracking_number);


--
-- TOC entry 5351 (class 2606 OID 17002)
-- Name: delivery_feedback delivery_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_feedback
    ADD CONSTRAINT delivery_feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 5418 (class 2606 OID 17662)
-- Name: delivery_partner_payouts delivery_partner_payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_payouts
    ADD CONSTRAINT delivery_partner_payouts_pkey PRIMARY KEY (payout_id);


--
-- TOC entry 5443 (class 2606 OID 17782)
-- Name: delivery_partner_wallets delivery_partner_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_wallets
    ADD CONSTRAINT delivery_partner_wallets_pkey PRIMARY KEY (wallet_id);


--
-- TOC entry 5327 (class 2606 OID 19267)
-- Name: delivery_partners delivery_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partners
    ADD CONSTRAINT delivery_partners_pkey PRIMARY KEY (delivery_partner_id);


--
-- TOC entry 5414 (class 2606 OID 17641)
-- Name: delivery_pricing delivery_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_pricing
    ADD CONSTRAINT delivery_pricing_pkey PRIMARY KEY (pricing_id);


--
-- TOC entry 5338 (class 2606 OID 16947)
-- Name: delivery_tracking delivery_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_tracking
    ADD CONSTRAINT delivery_tracking_pkey PRIMARY KEY (tracking_id);


--
-- TOC entry 5416 (class 2606 OID 17652)
-- Name: delivery_zones delivery_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_zones
    ADD CONSTRAINT delivery_zones_pkey PRIMARY KEY (zone_id);


--
-- TOC entry 5427 (class 2606 OID 17704)
-- Name: email_subscriptions email_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_subscriptions
    ADD CONSTRAINT email_subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- TOC entry 5490 (class 2606 OID 19653)
-- Name: event_queue event_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_queue
    ADD CONSTRAINT event_queue_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5319 (class 2606 OID 16853)
-- Name: finance_management finance_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_management
    ADD CONSTRAINT finance_management_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5451 (class 2606 OID 17826)
-- Name: gdpr_requests gdpr_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gdpr_requests
    ADD CONSTRAINT gdpr_requests_pkey PRIMARY KEY (request_id);


--
-- TOC entry 5458 (class 2606 OID 17857)
-- Name: gift_cards gift_cards_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards
    ADD CONSTRAINT gift_cards_code_key UNIQUE (code);


--
-- TOC entry 5460 (class 2606 OID 17855)
-- Name: gift_cards gift_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards
    ADD CONSTRAINT gift_cards_pkey PRIMARY KEY (gift_card_id);


--
-- TOC entry 5466 (class 2606 OID 17888)
-- Name: integration_webhooks integration_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integration_webhooks
    ADD CONSTRAINT integration_webhooks_pkey PRIMARY KEY (webhook_id);


--
-- TOC entry 5525 (class 2606 OID 19934)
-- Name: inventory_alerts inventory_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_alerts
    ADD CONSTRAINT inventory_alerts_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 5390 (class 2606 OID 17175)
-- Name: inventory_logs inventory_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5210 (class 2606 OID 16398)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 5573 (class 2606 OID 20884)
-- Name: job_run_history job_run_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_run_history
    ADD CONSTRAINT job_run_history_pkey PRIMARY KEY (job_id);


--
-- TOC entry 5580 (class 2606 OID 20908)
-- Name: kpi_anomaly_flags kpi_anomaly_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_anomaly_flags
    ADD CONSTRAINT kpi_anomaly_flags_pkey PRIMARY KEY (flag_id);


--
-- TOC entry 5590 (class 2606 OID 20971)
-- Name: kpi_correlations kpi_correlations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_correlations
    ADD CONSTRAINT kpi_correlations_pkey PRIMARY KEY (corr_id);


--
-- TOC entry 5592 (class 2606 OID 20973)
-- Name: kpi_correlations kpi_correlations_tenant_id_kpi_x_kpi_y_period_days_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_correlations
    ADD CONSTRAINT kpi_correlations_tenant_id_kpi_x_kpi_y_period_days_key UNIQUE (tenant_id, kpi_x, kpi_y, period_days);


--
-- TOC entry 5577 (class 2606 OID 20898)
-- Name: kpi_daily_snapshot kpi_daily_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_daily_snapshot
    ADD CONSTRAINT kpi_daily_snapshot_pkey PRIMARY KEY (snapshot_date, tenant_id);


--
-- TOC entry 5588 (class 2606 OID 20961)
-- Name: kpi_explainability_logs kpi_explainability_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_explainability_logs
    ADD CONSTRAINT kpi_explainability_logs_pkey PRIMARY KEY (explain_id);


--
-- TOC entry 5583 (class 2606 OID 20927)
-- Name: kpi_forecast kpi_forecast_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_forecast
    ADD CONSTRAINT kpi_forecast_pkey PRIMARY KEY (forecast_date, tenant_id, kpi_name);


--
-- TOC entry 5585 (class 2606 OID 20935)
-- Name: kpi_thresholds kpi_thresholds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_thresholds
    ADD CONSTRAINT kpi_thresholds_pkey PRIMARY KEY (tenant_id, kpi_name);


--
-- TOC entry 5556 (class 2606 OID 20778)
-- Name: login_failures login_failures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_failures
    ADD CONSTRAINT login_failures_pkey PRIMARY KEY (failure_id);


--
-- TOC entry 5468 (class 2606 OID 18927)
-- Name: lookup_statuses lookup_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_statuses
    ADD CONSTRAINT lookup_statuses_pkey PRIMARY KEY (status_key);


--
-- TOC entry 5456 (class 2606 OID 17845)
-- Name: loyalty_points loyalty_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loyalty_points
    ADD CONSTRAINT loyalty_points_pkey PRIMARY KEY (loyalty_id);


--
-- TOC entry 5349 (class 2606 OID 16985)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);


--
-- TOC entry 5601 (class 2606 OID 21069)
-- Name: notification_delivery_logs notification_delivery_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_delivery_logs
    ADD CONSTRAINT notification_delivery_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5424 (class 2606 OID 17695)
-- Name: notification_templates notification_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_templates
    ADD CONSTRAINT notification_templates_pkey PRIMARY KEY (template_id);


--
-- TOC entry 5342 (class 2606 OID 16963)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 5397 (class 2606 OID 17574)
-- Name: order_invoices order_invoices_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_invoices
    ADD CONSTRAINT order_invoices_invoice_number_key UNIQUE (invoice_number);


--
-- TOC entry 5399 (class 2606 OID 17572)
-- Name: order_invoices order_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_invoices
    ADD CONSTRAINT order_invoices_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 5364 (class 2606 OID 19214)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 5317 (class 2606 OID 16839)
-- Name: order_management order_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_management
    ADD CONSTRAINT order_management_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5395 (class 2606 OID 17560)
-- Name: order_status_logs order_status_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs
    ADD CONSTRAINT order_status_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5358 (class 2606 OID 17027)
-- Name: orders orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);


--
-- TOC entry 5360 (class 2606 OID 19176)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 5370 (class 2606 OID 19222)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 5502 (class 2606 OID 19714)
-- Name: permissions permissions_permission_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_permission_key_key UNIQUE (permission_key);


--
-- TOC entry 5504 (class 2606 OID 19712)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);


--
-- TOC entry 5403 (class 2606 OID 17594)
-- Name: product_attributes product_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attributes
    ADD CONSTRAINT product_attributes_pkey PRIMARY KEY (attribute_id);


--
-- TOC entry 5239 (class 2606 OID 19160)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 5313 (class 2606 OID 16801)
-- Name: product_management product_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_management
    ADD CONSTRAINT product_management_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5522 (class 2606 OID 19902)
-- Name: product_recommendations product_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_pkey PRIMARY KEY (product_id, recommended_product_id);


--
-- TOC entry 5401 (class 2606 OID 17586)
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (review_id);


--
-- TOC entry 5256 (class 2606 OID 16548)
-- Name: product_tag_map product_tag_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_map
    ADD CONSTRAINT product_tag_map_pkey PRIMARY KEY (map_id);


--
-- TOC entry 5258 (class 2606 OID 16550)
-- Name: product_tag_map product_tag_map_product_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_map
    ADD CONSTRAINT product_tag_map_product_id_tag_id_key UNIQUE (product_id, tag_id);


--
-- TOC entry 5248 (class 2606 OID 19893)
-- Name: product_tags product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, tag_id);


--
-- TOC entry 5250 (class 2606 OID 16540)
-- Name: product_tags product_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_slug_key UNIQUE (slug);


--
-- TOC entry 5252 (class 2606 OID 16538)
-- Name: product_tags product_tags_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_tag_name_key UNIQUE (tag_name);


--
-- TOC entry 5482 (class 2606 OID 19609)
-- Name: product_translations product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_pkey PRIMARY KEY (translation_id);


--
-- TOC entry 5484 (class 2606 OID 19611)
-- Name: product_translations product_translations_product_id_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_product_id_language_code_key UNIQUE (product_id, language_code);


--
-- TOC entry 5242 (class 2606 OID 19147)
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (variant_id);


--
-- TOC entry 5244 (class 2606 OID 16520)
-- Name: product_variants product_variants_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_sku_key UNIQUE (sku);


--
-- TOC entry 5232 (class 2606 OID 19089)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5234 (class 2606 OID 16475)
-- Name: products products_product_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_code_key UNIQUE (product_code);


--
-- TOC entry 5236 (class 2606 OID 16477)
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- TOC entry 5476 (class 2606 OID 19593)
-- Name: promotions promotions_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_code_key UNIQUE (code);


--
-- TOC entry 5478 (class 2606 OID 19591)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (promotion_id);


--
-- TOC entry 5445 (class 2606 OID 17793)
-- Name: refund_items refund_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_items
    ADD CONSTRAINT refund_items_pkey PRIMARY KEY (refund_item_id);


--
-- TOC entry 5375 (class 2606 OID 19235)
-- Name: refunds refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (refund_id);


--
-- TOC entry 5496 (class 2606 OID 19676)
-- Name: returns returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (return_id);


--
-- TOC entry 5527 (class 2606 OID 19953)
-- Name: risk_flags risk_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_flags
    ADD CONSTRAINT risk_flags_pkey PRIMARY KEY (flag_id);


--
-- TOC entry 5506 (class 2606 OID 19721)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5508 (class 2606 OID 19723)
-- Name: role_permissions role_permissions_role_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_permission_id_key UNIQUE (role_id, permission_id);


--
-- TOC entry 5498 (class 2606 OID 19701)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5500 (class 2606 OID 19703)
-- Name: roles roles_role_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_key_key UNIQUE (role_key);


--
-- TOC entry 5717 (class 2606 OID 22010)
-- Name: rt_consumers rt_consumers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_consumers
    ADD CONSTRAINT rt_consumers_name_key UNIQUE (name);


--
-- TOC entry 5719 (class 2606 OID 22008)
-- Name: rt_consumers rt_consumers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_consumers
    ADD CONSTRAINT rt_consumers_pkey PRIMARY KEY (consumer_id);


--
-- TOC entry 5721 (class 2606 OID 22017)
-- Name: rt_event_offsets rt_event_offsets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_offsets
    ADD CONSTRAINT rt_event_offsets_pkey PRIMARY KEY (consumer_id);


--
-- TOC entry 5715 (class 2606 OID 21992)
-- Name: rt_event_outbox rt_event_outbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_outbox
    ADD CONSTRAINT rt_event_outbox_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5710 (class 2606 OID 21980)
-- Name: rt_event_topics rt_event_topics_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_topics
    ADD CONSTRAINT rt_event_topics_name_key UNIQUE (name);


--
-- TOC entry 5712 (class 2606 OID 21978)
-- Name: rt_event_topics rt_event_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_topics
    ADD CONSTRAINT rt_event_topics_pkey PRIMARY KEY (topic_id);


--
-- TOC entry 5729 (class 2606 OID 22099)
-- Name: rt_job_schedule rt_job_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_job_schedule
    ADD CONSTRAINT rt_job_schedule_pkey PRIMARY KEY (job_name);


--
-- TOC entry 5727 (class 2606 OID 22079)
-- Name: rt_webhook_deliveries rt_webhook_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_deliveries
    ADD CONSTRAINT rt_webhook_deliveries_pkey PRIMARY KEY (delivery_id);


--
-- TOC entry 5724 (class 2606 OID 22067)
-- Name: rt_webhook_endpoints rt_webhook_endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_endpoints
    ADD CONSTRAINT rt_webhook_endpoints_pkey PRIMARY KEY (webhook_id);


--
-- TOC entry 5464 (class 2606 OID 17877)
-- Name: seo_metadata seo_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seo_metadata
    ADD CONSTRAINT seo_metadata_pkey PRIMARY KEY (seo_id);


--
-- TOC entry 5785 (class 2606 OID 22726)
-- Name: shop_bots shop_bots_bot_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_bots
    ADD CONSTRAINT shop_bots_bot_token_key UNIQUE (bot_token);


--
-- TOC entry 5787 (class 2606 OID 22724)
-- Name: shop_bots shop_bots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_bots
    ADD CONSTRAINT shop_bots_pkey PRIMARY KEY (bot_id);


--
-- TOC entry 5311 (class 2606 OID 16782)
-- Name: shop_management shop_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_management
    ADD CONSTRAINT shop_management_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5383 (class 2606 OID 19261)
-- Name: shop_payouts shop_payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_payouts
    ADD CONSTRAINT shop_payouts_pkey PRIMARY KEY (payout_id);


--
-- TOC entry 5441 (class 2606 OID 19264)
-- Name: shop_wallets shop_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_wallets
    ADD CONSTRAINT shop_wallets_pkey PRIMARY KEY (wallet_id);


--
-- TOC entry 5216 (class 2606 OID 19036)
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (shop_id);


--
-- TOC entry 5218 (class 2606 OID 16430)
-- Name: shops shops_shop_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_shop_code_key UNIQUE (shop_code);


--
-- TOC entry 5220 (class 2606 OID 16432)
-- Name: shops shops_shop_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_shop_slug_key UNIQUE (shop_slug);


--
-- TOC entry 5472 (class 2606 OID 19543)
-- Name: stock_transactions stock_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 5462 (class 2606 OID 17867)
-- Name: store_credits store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_credits
    ADD CONSTRAINT store_credits_pkey PRIMARY KEY (credit_id);


--
-- TOC entry 5412 (class 2606 OID 17627)
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 5745 (class 2606 OID 22300)
-- Name: sys_audit_log sys_audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_audit_log
    ADD CONSTRAINT sys_audit_log_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 5771 (class 2606 OID 22576)
-- Name: sys_compliance_findings sys_compliance_findings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_compliance_findings
    ADD CONSTRAINT sys_compliance_findings_pkey PRIMARY KEY (finding_id);


--
-- TOC entry 5775 (class 2606 OID 22671)
-- Name: sys_control_policies sys_control_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_control_policies
    ADD CONSTRAINT sys_control_policies_pkey PRIMARY KEY (policy_id);


--
-- TOC entry 5777 (class 2606 OID 22673)
-- Name: sys_control_policies sys_control_policies_tenant_id_component_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_control_policies
    ADD CONSTRAINT sys_control_policies_tenant_id_component_key UNIQUE (tenant_id, component);


--
-- TOC entry 5733 (class 2606 OID 22150)
-- Name: sys_health_events sys_health_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_health_events
    ADD CONSTRAINT sys_health_events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5751 (class 2606 OID 22393)
-- Name: sys_heartbeat sys_heartbeat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_heartbeat
    ADD CONSTRAINT sys_heartbeat_pkey PRIMARY KEY (tenant_id, component);


--
-- TOC entry 5747 (class 2606 OID 22347)
-- Name: sys_jobs sys_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_jobs
    ADD CONSTRAINT sys_jobs_pkey PRIMARY KEY (job_id);


--
-- TOC entry 5749 (class 2606 OID 22385)
-- Name: sys_metrics sys_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_metrics
    ADD CONSTRAINT sys_metrics_pkey PRIMARY KEY (metric_id);


--
-- TOC entry 5769 (class 2606 OID 22558)
-- Name: sys_ops_governance sys_ops_governance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_ops_governance
    ADD CONSTRAINT sys_ops_governance_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5773 (class 2606 OID 22587)
-- Name: sys_self_heal_actions sys_self_heal_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_self_heal_actions
    ADD CONSTRAINT sys_self_heal_actions_pkey PRIMARY KEY (action_id);


--
-- TOC entry 5781 (class 2606 OID 22685)
-- Name: sys_telemetry_ingest sys_telemetry_ingest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sys_telemetry_ingest
    ADD CONSTRAINT sys_telemetry_ingest_pkey PRIMARY KEY (telemetry_id);


--
-- TOC entry 5433 (class 2606 OID 17738)
-- Name: system_banners system_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_banners
    ADD CONSTRAINT system_banners_pkey PRIMARY KEY (banner_id);


--
-- TOC entry 5546 (class 2606 OID 20711)
-- Name: system_events system_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_events
    ADD CONSTRAINT system_events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5435 (class 2606 OID 17749)
-- Name: system_pages system_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_pages
    ADD CONSTRAINT system_pages_pkey PRIMARY KEY (page_id);


--
-- TOC entry 5437 (class 2606 OID 17751)
-- Name: system_pages system_pages_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_pages
    ADD CONSTRAINT system_pages_slug_key UNIQUE (slug);


--
-- TOC entry 5321 (class 2606 OID 16869)
-- Name: system_settings system_settings_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_key_key UNIQUE (key);


--
-- TOC entry 5323 (class 2606 OID 16867)
-- Name: system_settings system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (setting_id);


--
-- TOC entry 5516 (class 2606 OID 19881)
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- TOC entry 5518 (class 2606 OID 19879)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- TOC entry 5633 (class 2606 OID 21350)
-- Name: tenant_policies tenant_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant_policies
    ADD CONSTRAINT tenant_policies_pkey PRIMARY KEY (tenant_id);


--
-- TOC entry 5548 (class 2606 OID 20738)
-- Name: tenants tenants_api_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_api_key_key UNIQUE (api_key);


--
-- TOC entry 5550 (class 2606 OID 20736)
-- Name: tenants tenants_domain_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_domain_key UNIQUE (domain);


--
-- TOC entry 5552 (class 2606 OID 20734)
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (tenant_id);


--
-- TOC entry 5408 (class 2606 OID 17604)
-- Name: user_activity_logs user_activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_pkey PRIMARY KEY (activity_id);


--
-- TOC entry 5276 (class 2606 OID 16625)
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (address_id);


--
-- TOC entry 5560 (class 2606 OID 20796)
-- Name: user_behavior_metrics user_behavior_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_behavior_metrics
    ADD CONSTRAINT user_behavior_metrics_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5280 (class 2606 OID 16638)
-- Name: user_favorites user_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_pkey PRIMARY KEY (favorite_id);


--
-- TOC entry 5315 (class 2606 OID 16820)
-- Name: user_management user_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_management
    ADD CONSTRAINT user_management_pkey PRIMARY KEY (record_id);


--
-- TOC entry 5563 (class 2606 OID 20823)
-- Name: user_recommendations user_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_recommendations
    ADD CONSTRAINT user_recommendations_pkey PRIMARY KEY (user_id, recommended_product_id);


--
-- TOC entry 5283 (class 2606 OID 16660)
-- Name: user_reviews user_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_pkey PRIMARY KEY (review_id);


--
-- TOC entry 5512 (class 2606 OID 19740)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5514 (class 2606 OID 19742)
-- Name: user_roles user_roles_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- TOC entry 5554 (class 2606 OID 20763)
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (session_id);


--
-- TOC entry 5286 (class 2606 OID 16680)
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (token_id);


--
-- TOC entry 5410 (class 2606 OID 17615)
-- Name: user_verifications user_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications
    ADD CONSTRAINT user_verifications_pkey PRIMARY KEY (verification_id);


--
-- TOC entry 5263 (class 2606 OID 16590)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5265 (class 2606 OID 18933)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5273 (class 2606 OID 16603)
-- Name: users_seller_info users_seller_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_seller_info
    ADD CONSTRAINT users_seller_info_pkey PRIMARY KEY (seller_id);


--
-- TOC entry 5267 (class 2606 OID 22711)
-- Name: users users_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telegram_id_key UNIQUE (telegram_id);


--
-- TOC entry 5269 (class 2606 OID 16588)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5488 (class 2606 OID 19634)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 5570 (class 1259 OID 20864)
-- Name: idx_ab_assignments_experiment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ab_assignments_experiment ON public.ab_assignments USING btree (experiment_id);


--
-- TOC entry 5305 (class 1259 OID 16746)
-- Name: idx_admins_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_admins_username ON public.admins USING btree (username);


--
-- TOC entry 5669 (class 1259 OID 21663)
-- Name: idx_ai_agent_messages_topic; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_agent_messages_topic ON public.ai_agent_messages USING btree (topic, created_at DESC);


--
-- TOC entry 5705 (class 1259 OID 21947)
-- Name: idx_ai_bias_audit_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_bias_audit_tenant ON public.ai_bias_audit_results USING btree (tenant_id, model_type, created_at DESC);


--
-- TOC entry 5623 (class 1259 OID 21294)
-- Name: idx_ai_campaign_outcomes_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_campaign_outcomes_user ON public.ai_campaign_outcomes USING btree (user_id, observed_at DESC);


--
-- TOC entry 5615 (class 1259 OID 21230)
-- Name: idx_ai_churn_predictions_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_churn_predictions_user ON public.ai_churn_predictions USING btree (user_id, created_at DESC);


--
-- TOC entry 5641 (class 1259 OID 21403)
-- Name: idx_ai_compliance_alerts_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_compliance_alerts_tenant ON public.ai_compliance_alerts USING btree (tenant_id, detected_at DESC);


--
-- TOC entry 5702 (class 1259 OID 21936)
-- Name: idx_ai_explain_logs_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_explain_logs_tenant ON public.ai_explainability_logs USING btree (tenant_id, created_at DESC);


--
-- TOC entry 5708 (class 1259 OID 21956)
-- Name: idx_ai_fairness_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_fairness_tenant ON public.ai_fairness_scores USING btree (tenant_id, model_type, created_at DESC);


--
-- TOC entry 5604 (class 1259 OID 21091)
-- Name: idx_ai_insight_trends_entity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_insight_trends_entity ON public.ai_insight_trends USING btree (entity_type, entity_id, snapshot_date DESC);


--
-- TOC entry 5610 (class 1259 OID 21121)
-- Name: idx_ai_marketing_insights_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_marketing_insights_date ON public.ai_marketing_insights USING btree (snapshot_date DESC);


--
-- TOC entry 5607 (class 1259 OID 21110)
-- Name: idx_ai_recommendations_base; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_recommendations_base ON public.ai_recommendations USING btree (base_product_id, confidence DESC);


--
-- TOC entry 5618 (class 1259 OID 21247)
-- Name: idx_ai_retention_actions_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_retention_actions_user ON public.ai_retention_actions USING btree (user_id, status);


--
-- TOC entry 5652 (class 1259 OID 21540)
-- Name: idx_ai_rl_feedback_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ai_rl_feedback_tenant ON public.ai_rl_feedback USING btree (tenant_id, model_type, forecast_date DESC);


--
-- TOC entry 5598 (class 1259 OID 21017)
-- Name: idx_alert_queue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_alert_queue_status ON public.alert_queue USING btree (status, created_at DESC);


--
-- TOC entry 5595 (class 1259 OID 20999)
-- Name: idx_alert_rules_tenant_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_alert_rules_tenant_active ON public.alert_rules USING btree (tenant_id, active);


--
-- TOC entry 5386 (class 1259 OID 17166)
-- Name: idx_analytics_report_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_analytics_report_date ON public.analytics USING btree (report_date);


--
-- TOC entry 5534 (class 1259 OID 19997)
-- Name: idx_api_tokens_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_tokens_token ON public.api_tokens USING btree (token);


--
-- TOC entry 5535 (class 1259 OID 19996)
-- Name: idx_api_tokens_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_tokens_user ON public.api_tokens USING btree (user_id);


--
-- TOC entry 5636 (class 1259 OID 21361)
-- Name: idx_audit_access_logs_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_access_logs_tenant ON public.audit_access_logs USING btree (tenant_id, access_time DESC);


--
-- TOC entry 5393 (class 1259 OID 17202)
-- Name: idx_audit_trail_table_record; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_trail_table_record ON public.audit_trail USING btree (table_name, record_id);


--
-- TOC entry 5225 (class 1259 OID 16568)
-- Name: idx_categories_level; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_categories_level ON public.categories USING btree (level);


--
-- TOC entry 5226 (class 1259 OID 16567)
-- Name: idx_categories_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_categories_parent ON public.categories USING btree (parent_id);


--
-- TOC entry 5345 (class 1259 OID 16974)
-- Name: idx_chat_rooms_related_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_rooms_related_order ON public.chat_rooms USING btree (related_order_id);


--
-- TOC entry 5380 (class 1259 OID 17140)
-- Name: idx_coupons_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_coupons_code ON public.coupons USING btree (code);


--
-- TOC entry 5333 (class 1259 OID 16937)
-- Name: idx_deliveries_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_deliveries_shop_id ON public.deliveries USING btree (shop_id);


--
-- TOC entry 5334 (class 1259 OID 20752)
-- Name: idx_deliveries_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_deliveries_tenant_id ON public.deliveries USING btree (tenant_id);


--
-- TOC entry 5335 (class 1259 OID 16938)
-- Name: idx_deliveries_tracking_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_deliveries_tracking_number ON public.deliveries USING btree (tracking_number);


--
-- TOC entry 5336 (class 1259 OID 16936)
-- Name: idx_deliveries_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_deliveries_user_id ON public.deliveries USING btree (user_id);


--
-- TOC entry 5352 (class 1259 OID 17013)
-- Name: idx_delivery_feedback_delivery_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_delivery_feedback_delivery_id ON public.delivery_feedback USING btree (delivery_id);


--
-- TOC entry 5599 (class 1259 OID 21080)
-- Name: idx_delivery_logs_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_delivery_logs_status ON public.notification_delivery_logs USING btree (status, created_at DESC);


--
-- TOC entry 5328 (class 1259 OID 16901)
-- Name: idx_delivery_partners_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_delivery_partners_name ON public.delivery_partners USING btree (name);


--
-- TOC entry 5339 (class 1259 OID 16953)
-- Name: idx_delivery_tracking_delivery_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_delivery_tracking_delivery_id ON public.delivery_tracking USING btree (delivery_id);


--
-- TOC entry 5491 (class 1259 OID 19655)
-- Name: idx_event_queue_event_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_queue_event_type ON public.event_queue USING btree (event_type);


--
-- TOC entry 5492 (class 1259 OID 19654)
-- Name: idx_event_queue_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_queue_status ON public.event_queue USING btree (status);


--
-- TOC entry 5536 (class 1259 OID 20008)
-- Name: idx_financial_summary_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_financial_summary_date ON public.financial_summary USING btree (report_date);


--
-- TOC entry 5452 (class 1259 OID 19755)
-- Name: idx_gdpr_requests_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gdpr_requests_user_id ON public.gdpr_requests USING btree (user_id);


--
-- TOC entry 5523 (class 1259 OID 19940)
-- Name: idx_inventory_alerts_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventory_alerts_product ON public.inventory_alerts USING btree (product_id);


--
-- TOC entry 5387 (class 1259 OID 17191)
-- Name: idx_inventory_logs_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventory_logs_product_id ON public.inventory_logs USING btree (product_id);


--
-- TOC entry 5388 (class 1259 OID 17192)
-- Name: idx_inventory_logs_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventory_logs_variant_id ON public.inventory_logs USING btree (variant_id);


--
-- TOC entry 5571 (class 1259 OID 20885)
-- Name: idx_job_run_history_name_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_job_run_history_name_time ON public.job_run_history USING btree (job_name, started_at DESC);


--
-- TOC entry 5578 (class 1259 OID 20909)
-- Name: idx_kpi_anomaly_flags_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kpi_anomaly_flags_key ON public.kpi_anomaly_flags USING btree (kpi_name, snapshot_date DESC);


--
-- TOC entry 5574 (class 1259 OID 20900)
-- Name: idx_kpi_daily_snapshot_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kpi_daily_snapshot_date ON public.kpi_daily_snapshot USING btree (snapshot_date DESC);


--
-- TOC entry 5575 (class 1259 OID 20899)
-- Name: idx_kpi_daily_snapshot_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kpi_daily_snapshot_tenant ON public.kpi_daily_snapshot USING btree (tenant_id);


--
-- TOC entry 5586 (class 1259 OID 20962)
-- Name: idx_kpi_explain_logs_tenant_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kpi_explain_logs_tenant_date ON public.kpi_explainability_logs USING btree (tenant_id, snapshot_date DESC);


--
-- TOC entry 5581 (class 1259 OID 20928)
-- Name: idx_kpi_forecast_tenant_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kpi_forecast_tenant_date ON public.kpi_forecast USING btree (tenant_id, forecast_date);


--
-- TOC entry 5346 (class 1259 OID 16991)
-- Name: idx_messages_chat_room_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_chat_room_id ON public.messages USING btree (chat_room_id);


--
-- TOC entry 5347 (class 1259 OID 16992)
-- Name: idx_messages_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_sender_id ON public.messages USING btree (sender_id);


--
-- TOC entry 5340 (class 1259 OID 16964)
-- Name: idx_notifications_receiver; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notifications_receiver ON public.notifications USING btree (receiver_id, receiver_role);


--
-- TOC entry 5361 (class 1259 OID 17069)
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- TOC entry 5362 (class 1259 OID 17070)
-- Name: idx_order_items_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_product_id ON public.order_items USING btree (product_id);


--
-- TOC entry 5353 (class 1259 OID 17045)
-- Name: idx_orders_order_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_order_number ON public.orders USING btree (order_number);


--
-- TOC entry 5354 (class 1259 OID 17044)
-- Name: idx_orders_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_shop_id ON public.orders USING btree (shop_id);


--
-- TOC entry 5355 (class 1259 OID 20746)
-- Name: idx_orders_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_tenant_id ON public.orders USING btree (tenant_id);


--
-- TOC entry 5356 (class 1259 OID 17043)
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 5365 (class 1259 OID 17091)
-- Name: idx_payments_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_order_id ON public.payments USING btree (order_id);


--
-- TOC entry 5366 (class 1259 OID 20748)
-- Name: idx_payments_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_tenant_id ON public.payments USING btree (tenant_id);


--
-- TOC entry 5367 (class 1259 OID 17093)
-- Name: idx_payments_transaction_ref; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_transaction_ref ON public.payments USING btree (transaction_ref);


--
-- TOC entry 5368 (class 1259 OID 17092)
-- Name: idx_payments_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_user_id ON public.payments USING btree (user_id);


--
-- TOC entry 5237 (class 1259 OID 16569)
-- Name: idx_product_images_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_images_product ON public.product_images USING btree (product_id);


--
-- TOC entry 5519 (class 1259 OID 19913)
-- Name: idx_product_recommendations_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_recommendations_product ON public.product_recommendations USING btree (product_id);


--
-- TOC entry 5520 (class 1259 OID 19914)
-- Name: idx_product_recommendations_recommended; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_recommendations_recommended ON public.product_recommendations USING btree (recommended_product_id);


--
-- TOC entry 5253 (class 1259 OID 16571)
-- Name: idx_product_tag_map_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_tag_map_product ON public.product_tag_map USING btree (product_id);


--
-- TOC entry 5254 (class 1259 OID 16572)
-- Name: idx_product_tag_map_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_tag_map_tag ON public.product_tag_map USING btree (tag_id);


--
-- TOC entry 5245 (class 1259 OID 19894)
-- Name: idx_product_tags_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_tags_product ON public.product_tags USING btree (product_id);


--
-- TOC entry 5246 (class 1259 OID 19895)
-- Name: idx_product_tags_tag; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_tags_tag ON public.product_tags USING btree (tag_id);


--
-- TOC entry 5479 (class 1259 OID 19618)
-- Name: idx_product_translations_lang; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_translations_lang ON public.product_translations USING btree (language_code);


--
-- TOC entry 5480 (class 1259 OID 19617)
-- Name: idx_product_translations_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_translations_product_id ON public.product_translations USING btree (product_id);


--
-- TOC entry 5240 (class 1259 OID 16570)
-- Name: idx_product_variants_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_variants_product ON public.product_variants USING btree (product_id);


--
-- TOC entry 5227 (class 1259 OID 16565)
-- Name: idx_products_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_category ON public.products USING btree (category_id);


--
-- TOC entry 5228 (class 1259 OID 16564)
-- Name: idx_products_shop; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_shop ON public.products USING btree (shop_id);


--
-- TOC entry 5229 (class 1259 OID 19379)
-- Name: idx_products_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_status ON public.products USING btree (status);


--
-- TOC entry 5230 (class 1259 OID 20744)
-- Name: idx_products_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_tenant_id ON public.products USING btree (tenant_id);


--
-- TOC entry 5473 (class 1259 OID 19756)
-- Name: idx_promotions_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_promotions_active ON public.promotions USING btree (active);


--
-- TOC entry 5474 (class 1259 OID 19594)
-- Name: idx_promotions_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_promotions_code ON public.promotions USING btree (code);


--
-- TOC entry 5371 (class 1259 OID 17124)
-- Name: idx_refunds_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_refunds_order_id ON public.refunds USING btree (order_id);


--
-- TOC entry 5372 (class 1259 OID 17125)
-- Name: idx_refunds_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_refunds_payment_id ON public.refunds USING btree (payment_id);


--
-- TOC entry 5373 (class 1259 OID 20750)
-- Name: idx_refunds_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_refunds_tenant_id ON public.refunds USING btree (tenant_id);


--
-- TOC entry 5493 (class 1259 OID 19692)
-- Name: idx_returns_order_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_returns_order_item_id ON public.returns USING btree (order_item_id);


--
-- TOC entry 5494 (class 1259 OID 19693)
-- Name: idx_returns_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_returns_user_id ON public.returns USING btree (user_id);


--
-- TOC entry 5713 (class 1259 OID 21998)
-- Name: idx_rt_outbox_status_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rt_outbox_status_created ON public.rt_event_outbox USING btree (status, created_at);


--
-- TOC entry 5725 (class 1259 OID 22090)
-- Name: idx_rt_webhook_deliveries_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rt_webhook_deliveries_status ON public.rt_webhook_deliveries USING btree (status, next_attempt);


--
-- TOC entry 5538 (class 1259 OID 20367)
-- Name: idx_sales_by_day_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sales_by_day_date ON public.sales_by_day USING btree (sale_date);


--
-- TOC entry 5381 (class 1259 OID 17156)
-- Name: idx_shop_payouts_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shop_payouts_shop_id ON public.shop_payouts USING btree (shop_id);


--
-- TOC entry 5211 (class 1259 OID 16563)
-- Name: idx_shops_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shops_location ON public.shops USING btree (city_province, district, commune);


--
-- TOC entry 5212 (class 1259 OID 16561)
-- Name: idx_shops_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shops_status ON public.shops USING btree (status);


--
-- TOC entry 5213 (class 1259 OID 20742)
-- Name: idx_shops_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shops_tenant_id ON public.shops USING btree (tenant_id);


--
-- TOC entry 5214 (class 1259 OID 16562)
-- Name: idx_shops_verified; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shops_verified ON public.shops USING btree (verified);


--
-- TOC entry 5469 (class 1259 OID 19640)
-- Name: idx_stock_transactions_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_stock_transactions_product_id ON public.stock_transactions USING btree (product_id);


--
-- TOC entry 5470 (class 1259 OID 19641)
-- Name: idx_stock_transactions_warehouse_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_stock_transactions_warehouse_id ON public.stock_transactions USING btree (warehouse_id);


--
-- TOC entry 5542 (class 1259 OID 20712)
-- Name: idx_system_events_table; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_system_events_table ON public.system_events USING btree (source_table);


--
-- TOC entry 5543 (class 1259 OID 20714)
-- Name: idx_system_events_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_system_events_time ON public.system_events USING btree (created_at);


--
-- TOC entry 5544 (class 1259 OID 20713)
-- Name: idx_system_events_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_system_events_type ON public.system_events USING btree (event_type);


--
-- TOC entry 5778 (class 1259 OID 22687)
-- Name: idx_telemetry_comp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_telemetry_comp ON public.sys_telemetry_ingest USING btree (component);


--
-- TOC entry 5779 (class 1259 OID 22686)
-- Name: idx_telemetry_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_telemetry_ts ON public.sys_telemetry_ingest USING btree (ts);


--
-- TOC entry 5404 (class 1259 OID 19573)
-- Name: idx_user_activity_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_activity_action ON public.user_activity_logs USING btree (action);


--
-- TOC entry 5405 (class 1259 OID 19571)
-- Name: idx_user_activity_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_activity_product_id ON public.user_activity_logs USING btree (product_id);


--
-- TOC entry 5406 (class 1259 OID 19572)
-- Name: idx_user_activity_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_activity_user_id ON public.user_activity_logs USING btree (user_id);


--
-- TOC entry 5274 (class 1259 OID 16631)
-- Name: idx_user_addresses_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_addresses_user_id ON public.user_addresses USING btree (user_id);


--
-- TOC entry 5557 (class 1259 OID 20802)
-- Name: idx_user_behavior_last_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_behavior_last_active ON public.user_behavior_metrics USING btree (last_active DESC);


--
-- TOC entry 5558 (class 1259 OID 20803)
-- Name: idx_user_behavior_rolling7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_behavior_rolling7 ON public.user_behavior_metrics USING btree (rolling_7d_purchases DESC);


--
-- TOC entry 5277 (class 1259 OID 16650)
-- Name: idx_user_favorites_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_favorites_product_id ON public.user_favorites USING btree (product_id);


--
-- TOC entry 5278 (class 1259 OID 16649)
-- Name: idx_user_favorites_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_favorites_user_id ON public.user_favorites USING btree (user_id);


--
-- TOC entry 5281 (class 1259 OID 16671)
-- Name: idx_user_reviews_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reviews_product_id ON public.user_reviews USING btree (product_id);


--
-- TOC entry 5509 (class 1259 OID 19754)
-- Name: idx_user_roles_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_roles_role_id ON public.user_roles USING btree (role_id);


--
-- TOC entry 5510 (class 1259 OID 19753)
-- Name: idx_user_roles_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_roles_user_id ON public.user_roles USING btree (user_id);


--
-- TOC entry 5284 (class 1259 OID 16686)
-- Name: idx_user_tokens_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_tokens_user_id ON public.user_tokens USING btree (user_id);


--
-- TOC entry 5259 (class 1259 OID 16592)
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- TOC entry 5270 (class 1259 OID 16615)
-- Name: idx_users_seller_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_seller_shop_id ON public.users_seller_info USING btree (shop_id);


--
-- TOC entry 5271 (class 1259 OID 16614)
-- Name: idx_users_seller_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_seller_user_id ON public.users_seller_info USING btree (user_id);


--
-- TOC entry 5260 (class 1259 OID 20740)
-- Name: idx_users_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_tenant_id ON public.users USING btree (tenant_id);


--
-- TOC entry 5261 (class 1259 OID 16591)
-- Name: idx_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_username ON public.users USING btree (username);


--
-- TOC entry 5666 (class 1259 OID 21642)
-- Name: uq_ai_agent_registry_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_ai_agent_registry_name ON public.ai_agent_registry USING btree (agent_name);


--
-- TOC entry 5655 (class 1259 OID 21553)
-- Name: uq_ai_rl_policy_model; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_ai_rl_policy_model ON public.ai_rl_policy_weights USING btree (tenant_id, model_type);


--
-- TOC entry 5537 (class 1259 OID 20571)
-- Name: uq_financial_summary_report_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_financial_summary_report_date ON public.financial_summary USING btree (report_date);


--
-- TOC entry 5722 (class 1259 OID 22043)
-- Name: uq_mv_stream_sales_5m_minute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_mv_stream_sales_5m_minute ON public.mv_stream_sales_5m USING btree (sale_minute);


--
-- TOC entry 5425 (class 1259 OID 21058)
-- Name: uq_notification_templates_name_channel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_notification_templates_name_channel ON public.notification_templates USING btree (channel, name);


--
-- TOC entry 5561 (class 1259 OID 20813)
-- Name: uq_product_affinity_pair; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_product_affinity_pair ON public.product_affinity USING btree (product_id_a, product_id_b);


--
-- TOC entry 5541 (class 1259 OID 20679)
-- Name: uq_product_conversion_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_product_conversion_product_id ON public.product_conversion_stats USING btree (product_id);


--
-- TOC entry 5539 (class 1259 OID 20693)
-- Name: uq_sales_by_day_sale_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_sales_by_day_sale_date ON public.sales_by_day USING btree (sale_date);


--
-- TOC entry 5540 (class 1259 OID 20655)
-- Name: uq_sales_forecast_report_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_sales_forecast_report_date ON public.sales_forecast USING btree (report_date);


--
-- TOC entry 5939 (class 2620 OID 19394)
-- Name: deliveries trg_audit_deliveries; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_deliveries AFTER INSERT OR DELETE OR UPDATE ON public.deliveries FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5944 (class 2620 OID 19391)
-- Name: order_items trg_audit_order_items; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_order_items AFTER INSERT OR DELETE OR UPDATE ON public.order_items FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5941 (class 2620 OID 19390)
-- Name: orders trg_audit_orders; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_orders AFTER INSERT OR DELETE OR UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5946 (class 2620 OID 19392)
-- Name: payments trg_audit_payments; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_payments AFTER INSERT OR DELETE OR UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5936 (class 2620 OID 19389)
-- Name: product_variants trg_audit_product_variants; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_product_variants AFTER INSERT OR DELETE OR UPDATE ON public.product_variants FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5934 (class 2620 OID 19388)
-- Name: products trg_audit_products; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_products AFTER INSERT OR DELETE OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5949 (class 2620 OID 19393)
-- Name: refunds trg_audit_refunds; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_refunds AFTER INSERT OR DELETE OR UPDATE ON public.refunds FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5951 (class 2620 OID 19395)
-- Name: shop_payouts trg_audit_shop_payouts; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_shop_payouts AFTER INSERT OR DELETE OR UPDATE ON public.shop_payouts FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5952 (class 2620 OID 19396)
-- Name: shop_wallets trg_audit_shop_wallets; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_shop_wallets AFTER INSERT OR DELETE OR UPDATE ON public.shop_wallets FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5932 (class 2620 OID 19398)
-- Name: shops trg_audit_shops; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_shops AFTER INSERT OR DELETE OR UPDATE ON public.shops FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5937 (class 2620 OID 19397)
-- Name: users trg_audit_users; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_users AFTER INSERT OR DELETE OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.fn_audit_change();


--
-- TOC entry 5953 (class 2620 OID 21022)
-- Name: kpi_explainability_logs trg_auto_enqueue_alert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_auto_enqueue_alert AFTER INSERT ON public.kpi_explainability_logs FOR EACH ROW EXECUTE FUNCTION public.trg_auto_enqueue_alert();


--
-- TOC entry 5940 (class 2620 OID 20723)
-- Name: deliveries trg_emit_deliveries; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_deliveries AFTER INSERT OR DELETE OR UPDATE ON public.deliveries FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5945 (class 2620 OID 20717)
-- Name: order_items trg_emit_order_items; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_order_items AFTER INSERT OR DELETE OR UPDATE ON public.order_items FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5942 (class 2620 OID 20716)
-- Name: orders trg_emit_orders; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_orders AFTER INSERT OR DELETE OR UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5947 (class 2620 OID 20721)
-- Name: payments trg_emit_payments; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_payments AFTER INSERT OR DELETE OR UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5935 (class 2620 OID 20718)
-- Name: products trg_emit_products; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_products AFTER INSERT OR DELETE OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5950 (class 2620 OID 20722)
-- Name: refunds trg_emit_refunds; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_refunds AFTER INSERT OR DELETE OR UPDATE ON public.refunds FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5933 (class 2620 OID 20720)
-- Name: shops trg_emit_shops; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_shops AFTER INSERT OR DELETE OR UPDATE ON public.shops FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5938 (class 2620 OID 20719)
-- Name: users trg_emit_users; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_emit_users AFTER INSERT OR DELETE OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.fn_emit_event();


--
-- TOC entry 5954 (class 2620 OID 22103)
-- Name: rt_event_outbox trg_queue_webhook; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_queue_webhook AFTER UPDATE OF status ON public.rt_event_outbox FOR EACH ROW EXECUTE FUNCTION public.trg_queue_webhook();


--
-- TOC entry 5943 (class 2620 OID 22029)
-- Name: orders trg_rt_order_created; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_rt_order_created AFTER INSERT ON public.orders FOR EACH ROW EXECUTE FUNCTION public.trg_emit_order_created();


--
-- TOC entry 5948 (class 2620 OID 22030)
-- Name: payments trg_rt_payment_received; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_rt_payment_received AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.trg_emit_payment_received();


--
-- TOC entry 5955 (class 2620 OID 22302)
-- Name: sys_audit_log trg_set_signature; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_set_signature BEFORE INSERT ON public.sys_audit_log FOR EACH ROW EXECUTE FUNCTION public.fn_audit_set_signature();


--
-- TOC entry 5894 (class 2606 OID 20859)
-- Name: ab_assignments ab_assignments_experiment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_assignments
    ADD CONSTRAINT ab_assignments_experiment_id_fkey FOREIGN KEY (experiment_id) REFERENCES public.ab_experiments(experiment_id) ON DELETE CASCADE;


--
-- TOC entry 5895 (class 2606 OID 20854)
-- Name: ab_assignments ab_assignments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_assignments
    ADD CONSTRAINT ab_assignments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5808 (class 2606 OID 16769)
-- Name: admin_login_sessions admin_login_sessions_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_login_sessions
    ADD CONSTRAINT admin_login_sessions_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id) ON DELETE CASCADE;


--
-- TOC entry 5807 (class 2606 OID 16756)
-- Name: admin_logs admin_logs_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_logs
    ADD CONSTRAINT admin_logs_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id) ON DELETE SET NULL;


--
-- TOC entry 5818 (class 2606 OID 16885)
-- Name: admin_notifications admin_notifications_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_notifications
    ADD CONSTRAINT admin_notifications_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5804 (class 2606 OID 16722)
-- Name: admin_role_permission_map admin_role_permission_map_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission_map
    ADD CONSTRAINT admin_role_permission_map_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(permission_id) ON DELETE CASCADE;


--
-- TOC entry 5805 (class 2606 OID 16717)
-- Name: admin_role_permission_map admin_role_permission_map_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission_map
    ADD CONSTRAINT admin_role_permission_map_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.admin_roles(role_id) ON DELETE CASCADE;


--
-- TOC entry 5806 (class 2606 OID 16741)
-- Name: admins admins_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.admin_roles(role_id) ON DELETE SET NULL;


--
-- TOC entry 5913 (class 2606 OID 21691)
-- Name: ai_agent_agreements ai_agent_agreements_negotiation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_agreements
    ADD CONSTRAINT ai_agent_agreements_negotiation_id_fkey FOREIGN KEY (negotiation_id) REFERENCES public.ai_agent_negotiations(negotiation_id) ON DELETE CASCADE;


--
-- TOC entry 5910 (class 2606 OID 21658)
-- Name: ai_agent_messages ai_agent_messages_receiver_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_messages
    ADD CONSTRAINT ai_agent_messages_receiver_agent_id_fkey FOREIGN KEY (receiver_agent_id) REFERENCES public.ai_agent_registry(agent_id) ON DELETE CASCADE;


--
-- TOC entry 5911 (class 2606 OID 21653)
-- Name: ai_agent_messages ai_agent_messages_sender_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_messages
    ADD CONSTRAINT ai_agent_messages_sender_agent_id_fkey FOREIGN KEY (sender_agent_id) REFERENCES public.ai_agent_registry(agent_id) ON DELETE CASCADE;


--
-- TOC entry 5912 (class 2606 OID 21675)
-- Name: ai_agent_negotiations ai_agent_negotiations_dominant_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_agent_negotiations
    ADD CONSTRAINT ai_agent_negotiations_dominant_agent_fkey FOREIGN KEY (dominant_agent) REFERENCES public.ai_agent_registry(agent_id);


--
-- TOC entry 5929 (class 2606 OID 22267)
-- Name: ai_campaign_metrics ai_campaign_metrics_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_metrics
    ADD CONSTRAINT ai_campaign_metrics_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.ai_campaigns(campaign_id) ON DELETE CASCADE;


--
-- TOC entry 5904 (class 2606 OID 21284)
-- Name: ai_campaign_outcomes ai_campaign_outcomes_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_outcomes
    ADD CONSTRAINT ai_campaign_outcomes_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.ai_retention_actions(action_id) ON DELETE CASCADE;


--
-- TOC entry 5905 (class 2606 OID 21289)
-- Name: ai_campaign_outcomes ai_campaign_outcomes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_outcomes
    ADD CONSTRAINT ai_campaign_outcomes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5927 (class 2606 OID 22247)
-- Name: ai_campaign_targets ai_campaign_targets_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_targets
    ADD CONSTRAINT ai_campaign_targets_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.ai_campaigns(campaign_id) ON DELETE CASCADE;


--
-- TOC entry 5928 (class 2606 OID 22252)
-- Name: ai_campaign_targets ai_campaign_targets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaign_targets
    ADD CONSTRAINT ai_campaign_targets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5926 (class 2606 OID 22236)
-- Name: ai_campaigns ai_campaigns_segment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_campaigns
    ADD CONSTRAINT ai_campaigns_segment_id_fkey FOREIGN KEY (segment_id) REFERENCES public.ai_marketing_segments(segment_id) ON DELETE SET NULL;


--
-- TOC entry 5902 (class 2606 OID 21225)
-- Name: ai_churn_predictions ai_churn_predictions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_churn_predictions
    ADD CONSTRAINT ai_churn_predictions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5901 (class 2606 OID 21205)
-- Name: ai_customer_profiles ai_customer_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_customer_profiles
    ADD CONSTRAINT ai_customer_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5908 (class 2606 OID 21600)
-- Name: ai_decision_events ai_decision_events_policy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_events
    ADD CONSTRAINT ai_decision_events_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES public.ai_decision_policies(policy_id) ON DELETE SET NULL;


--
-- TOC entry 5909 (class 2606 OID 21613)
-- Name: ai_decision_outcomes ai_decision_outcomes_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_decision_outcomes
    ADD CONSTRAINT ai_decision_outcomes_decision_id_fkey FOREIGN KEY (decision_id) REFERENCES public.ai_decision_events(decision_id) ON DELETE CASCADE;


--
-- TOC entry 5920 (class 2606 OID 21931)
-- Name: ai_explainability_logs ai_explainability_logs_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_explainability_logs
    ADD CONSTRAINT ai_explainability_logs_decision_id_fkey FOREIGN KEY (decision_id) REFERENCES public.ai_decision_events(decision_id) ON DELETE SET NULL;


--
-- TOC entry 5918 (class 2606 OID 21887)
-- Name: ai_federated_rounds ai_federated_rounds_global_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_rounds
    ADD CONSTRAINT ai_federated_rounds_global_model_id_fkey FOREIGN KEY (global_model_id) REFERENCES public.ai_global_model_registry(model_id) ON DELETE SET NULL;


--
-- TOC entry 5919 (class 2606 OID 21902)
-- Name: ai_federated_updates ai_federated_updates_round_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_federated_updates
    ADD CONSTRAINT ai_federated_updates_round_id_fkey FOREIGN KEY (round_id) REFERENCES public.ai_federated_rounds(round_id) ON DELETE CASCADE;


--
-- TOC entry 5907 (class 2606 OID 21516)
-- Name: ai_inventory_forecasts ai_inventory_forecasts_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_inventory_forecasts
    ADD CONSTRAINT ai_inventory_forecasts_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5914 (class 2606 OID 21728)
-- Name: ai_market_trends ai_market_trends_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_market_trends
    ADD CONSTRAINT ai_market_trends_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.ai_market_sources(source_id) ON DELETE SET NULL;


--
-- TOC entry 5906 (class 2606 OID 21501)
-- Name: ai_price_forecasts ai_price_forecasts_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_price_forecasts
    ADD CONSTRAINT ai_price_forecasts_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5899 (class 2606 OID 21100)
-- Name: ai_recommendations ai_recommendations_base_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_recommendations
    ADD CONSTRAINT ai_recommendations_base_product_id_fkey FOREIGN KEY (base_product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5900 (class 2606 OID 21105)
-- Name: ai_recommendations ai_recommendations_recommended_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_recommendations
    ADD CONSTRAINT ai_recommendations_recommended_product_id_fkey FOREIGN KEY (recommended_product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5903 (class 2606 OID 21242)
-- Name: ai_retention_actions ai_retention_actions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_retention_actions
    ADD CONSTRAINT ai_retention_actions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5916 (class 2606 OID 21800)
-- Name: ai_simulation_results ai_simulation_results_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_results
    ADD CONSTRAINT ai_simulation_results_run_id_fkey FOREIGN KEY (run_id) REFERENCES public.ai_simulation_runs(run_id) ON DELETE CASCADE;


--
-- TOC entry 5915 (class 2606 OID 21786)
-- Name: ai_simulation_runs ai_simulation_runs_scenario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_simulation_runs
    ADD CONSTRAINT ai_simulation_runs_scenario_id_fkey FOREIGN KEY (scenario_id) REFERENCES public.ai_scenario_library(scenario_id) ON DELETE CASCADE;


--
-- TOC entry 5917 (class 2606 OID 21849)
-- Name: ai_strategy_metrics ai_strategy_metrics_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_strategy_metrics
    ADD CONSTRAINT ai_strategy_metrics_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.ai_strategy_versions(strategy_id) ON DELETE CASCADE;


--
-- TOC entry 5925 (class 2606 OID 22126)
-- Name: ai_webhook_health ai_webhook_health_webhook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_webhook_health
    ADD CONSTRAINT ai_webhook_health_webhook_id_fkey FOREIGN KEY (webhook_id) REFERENCES public.rt_webhook_endpoints(webhook_id) ON DELETE CASCADE;


--
-- TOC entry 5896 (class 2606 OID 21012)
-- Name: alert_queue alert_queue_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_queue
    ADD CONSTRAINT alert_queue_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.alert_rules(rule_id) ON DELETE CASCADE;


--
-- TOC entry 5888 (class 2606 OID 19991)
-- Name: api_tokens api_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5788 (class 2606 OID 19164)
-- Name: categories categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(category_id);


--
-- TOC entry 5887 (class 2606 OID 19973)
-- Name: customer_metrics customer_metrics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_metrics
    ADD CONSTRAINT customer_metrics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5819 (class 2606 OID 16931)
-- Name: deliveries deliveries_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id) ON DELETE SET NULL;


--
-- TOC entry 5820 (class 2606 OID 19368)
-- Name: deliveries deliveries_delivery_partner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_delivery_partner_id_fkey FOREIGN KEY (delivery_partner_id) REFERENCES public.delivery_partners(delivery_partner_id) ON DELETE SET NULL;


--
-- TOC entry 5821 (class 2606 OID 19363)
-- Name: deliveries deliveries_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE SET NULL;


--
-- TOC entry 5822 (class 2606 OID 19358)
-- Name: deliveries deliveries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5825 (class 2606 OID 19249)
-- Name: delivery_feedback delivery_feedback_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_feedback
    ADD CONSTRAINT delivery_feedback_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(delivery_id) ON DELETE CASCADE;


--
-- TOC entry 5826 (class 2606 OID 18964)
-- Name: delivery_feedback delivery_feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_feedback
    ADD CONSTRAINT delivery_feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5823 (class 2606 OID 19244)
-- Name: delivery_tracking delivery_tracking_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_tracking
    ADD CONSTRAINT delivery_tracking_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(delivery_id) ON DELETE CASCADE;


--
-- TOC entry 5816 (class 2606 OID 16854)
-- Name: finance_management finance_management_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finance_management
    ADD CONSTRAINT finance_management_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5868 (class 2606 OID 18006)
-- Name: api_logs fk_api_logs_api_key_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT fk_api_logs_api_key_id FOREIGN KEY (api_key_id) REFERENCES public.api_keys(api_key_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5862 (class 2606 OID 19062)
-- Name: commission_rates fk_commission_rates_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_rates
    ADD CONSTRAINT fk_commission_rates_shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5858 (class 2606 OID 17956)
-- Name: coupon_usage fk_coupon_usage_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT fk_coupon_usage_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.coupons(coupon_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5859 (class 2606 OID 19192)
-- Name: coupon_usage fk_coupon_usage_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT fk_coupon_usage_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5860 (class 2606 OID 18989)
-- Name: coupon_usage fk_coupon_usage_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT fk_coupon_usage_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5857 (class 2606 OID 19268)
-- Name: delivery_partner_payouts fk_delivery_partner_payouts_delivery_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_payouts
    ADD CONSTRAINT fk_delivery_partner_payouts_delivery_partner_id FOREIGN KEY (delivery_partner_id) REFERENCES public.delivery_partners(delivery_partner_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5864 (class 2606 OID 19273)
-- Name: delivery_partner_wallets fk_delivery_partner_wallets_delivery_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_partner_wallets
    ADD CONSTRAINT fk_delivery_partner_wallets_delivery_partner_id FOREIGN KEY (delivery_partner_id) REFERENCES public.delivery_partners(delivery_partner_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5856 (class 2606 OID 19057)
-- Name: delivery_pricing fk_delivery_pricing_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_pricing
    ADD CONSTRAINT fk_delivery_pricing_shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5861 (class 2606 OID 18994)
-- Name: email_subscriptions fk_email_subscriptions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_subscriptions
    ADD CONSTRAINT fk_email_subscriptions_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5869 (class 2606 OID 18999)
-- Name: gdpr_requests fk_gdpr_requests_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gdpr_requests
    ADD CONSTRAINT fk_gdpr_requests_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5870 (class 2606 OID 19004)
-- Name: loyalty_points fk_loyalty_points_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loyalty_points
    ADD CONSTRAINT fk_loyalty_points_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5845 (class 2606 OID 19182)
-- Name: order_invoices fk_order_invoices_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_invoices
    ADD CONSTRAINT fk_order_invoices_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5844 (class 2606 OID 19177)
-- Name: order_status_logs fk_order_status_logs_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs
    ADD CONSTRAINT fk_order_status_logs_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5827 (class 2606 OID 19223)
-- Name: orders fk_orders_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_payment FOREIGN KEY (payment_id) REFERENCES public.payments(payment_id) ON DELETE SET NULL;


--
-- TOC entry 5828 (class 2606 OID 19759)
-- Name: orders fk_orders_promotion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_promotion_id FOREIGN KEY (promotion_id) REFERENCES public.promotions(promotion_id) ON DELETE SET NULL;


--
-- TOC entry 5849 (class 2606 OID 19120)
-- Name: product_attributes fk_product_attributes_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attributes
    ADD CONSTRAINT fk_product_attributes_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5846 (class 2606 OID 19187)
-- Name: product_reviews fk_product_reviews_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_product_reviews_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5847 (class 2606 OID 19115)
-- Name: product_reviews fk_product_reviews_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_product_reviews_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5848 (class 2606 OID 18969)
-- Name: product_reviews fk_product_reviews_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk_product_reviews_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5865 (class 2606 OID 19215)
-- Name: refund_items fk_refund_items_order_item_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_items
    ADD CONSTRAINT fk_refund_items_order_item_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5866 (class 2606 OID 19125)
-- Name: refund_items fk_refund_items_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_items
    ADD CONSTRAINT fk_refund_items_product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5867 (class 2606 OID 19236)
-- Name: refund_items fk_refund_items_refund_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund_items
    ADD CONSTRAINT fk_refund_items_refund_id FOREIGN KEY (refund_id) REFERENCES public.refunds(refund_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5863 (class 2606 OID 19373)
-- Name: shop_wallets fk_shop_wallets_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_wallets
    ADD CONSTRAINT fk_shop_wallets_shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5872 (class 2606 OID 19764)
-- Name: stock_transactions fk_stock_transactions_warehouse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT fk_stock_transactions_warehouse_id FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(warehouse_id) ON DELETE SET NULL;


--
-- TOC entry 5871 (class 2606 OID 19009)
-- Name: store_credits fk_store_credits_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_credits
    ADD CONSTRAINT fk_store_credits_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5854 (class 2606 OID 19052)
-- Name: support_tickets fk_support_tickets_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT fk_support_tickets_shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5855 (class 2606 OID 18984)
-- Name: support_tickets fk_support_tickets_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT fk_support_tickets_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5850 (class 2606 OID 18974)
-- Name: user_activity_logs fk_user_activity_logs_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT fk_user_activity_logs_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5852 (class 2606 OID 17931)
-- Name: user_verifications fk_user_verifications_admin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications
    ADD CONSTRAINT fk_user_verifications_admin_id FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5853 (class 2606 OID 18979)
-- Name: user_verifications fk_user_verifications_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications
    ADD CONSTRAINT fk_user_verifications_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5884 (class 2606 OID 19935)
-- Name: inventory_alerts inventory_alerts_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_alerts
    ADD CONSTRAINT inventory_alerts_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5841 (class 2606 OID 17186)
-- Name: inventory_logs inventory_logs_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id) ON DELETE SET NULL;


--
-- TOC entry 5842 (class 2606 OID 19110)
-- Name: inventory_logs inventory_logs_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE SET NULL;


--
-- TOC entry 5843 (class 2606 OID 19148)
-- Name: inventory_logs inventory_logs_variant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variants(variant_id) ON DELETE SET NULL;


--
-- TOC entry 5890 (class 2606 OID 20779)
-- Name: login_failures login_failures_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_failures
    ADD CONSTRAINT login_failures_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 5824 (class 2606 OID 16986)
-- Name: messages messages_chat_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_room_id_fkey FOREIGN KEY (chat_room_id) REFERENCES public.chat_rooms(chat_room_id) ON DELETE CASCADE;


--
-- TOC entry 5897 (class 2606 OID 21070)
-- Name: notification_delivery_logs notification_delivery_logs_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_delivery_logs
    ADD CONSTRAINT notification_delivery_logs_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alert_queue(alert_id) ON DELETE CASCADE;


--
-- TOC entry 5898 (class 2606 OID 21075)
-- Name: notification_delivery_logs notification_delivery_logs_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_delivery_logs
    ADD CONSTRAINT notification_delivery_logs_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES public.alert_rules(rule_id) ON DELETE SET NULL;


--
-- TOC entry 5832 (class 2606 OID 19318)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 5833 (class 2606 OID 19323)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE SET NULL;


--
-- TOC entry 5834 (class 2606 OID 19328)
-- Name: order_items order_items_variant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variants(variant_id) ON DELETE SET NULL;


--
-- TOC entry 5815 (class 2606 OID 16840)
-- Name: order_management order_management_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_management
    ADD CONSTRAINT order_management_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5829 (class 2606 OID 19313)
-- Name: orders orders_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(delivery_id) ON DELETE SET NULL;


--
-- TOC entry 5830 (class 2606 OID 19308)
-- Name: orders orders_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE SET NULL;


--
-- TOC entry 5831 (class 2606 OID 19303)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5835 (class 2606 OID 19333)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- TOC entry 5836 (class 2606 OID 19338)
-- Name: payments payments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5791 (class 2606 OID 19298)
-- Name: product_images product_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5811 (class 2606 OID 16807)
-- Name: product_management product_management_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_management
    ADD CONSTRAINT product_management_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5812 (class 2606 OID 19105)
-- Name: product_management product_management_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_management
    ADD CONSTRAINT product_management_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5882 (class 2606 OID 19903)
-- Name: product_recommendations product_recommendations_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5883 (class 2606 OID 19908)
-- Name: product_recommendations product_recommendations_recommended_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_recommended_product_id_fkey FOREIGN KEY (recommended_product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5795 (class 2606 OID 19090)
-- Name: product_tag_map product_tag_map_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_map
    ADD CONSTRAINT product_tag_map_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5793 (class 2606 OID 20039)
-- Name: product_tags product_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5794 (class 2606 OID 20044)
-- Name: product_tags product_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id) ON DELETE CASCADE;


--
-- TOC entry 5874 (class 2606 OID 19612)
-- Name: product_translations product_translations_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translations
    ADD CONSTRAINT product_translations_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5792 (class 2606 OID 19293)
-- Name: product_variants product_variants_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5789 (class 2606 OID 19288)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 5790 (class 2606 OID 19283)
-- Name: products products_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE CASCADE;


--
-- TOC entry 5837 (class 2606 OID 19343)
-- Name: refunds refunds_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- TOC entry 5838 (class 2606 OID 19348)
-- Name: refunds refunds_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payments(payment_id) ON DELETE SET NULL;


--
-- TOC entry 5839 (class 2606 OID 19353)
-- Name: refunds refunds_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refunds
    ADD CONSTRAINT refunds_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5875 (class 2606 OID 19677)
-- Name: returns returns_order_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_order_item_id_fkey FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id) ON DELETE CASCADE;


--
-- TOC entry 5876 (class 2606 OID 19687)
-- Name: returns returns_status_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_status_key_fkey FOREIGN KEY (status_key) REFERENCES public.lookup_statuses(status_key);


--
-- TOC entry 5877 (class 2606 OID 19682)
-- Name: returns returns_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5885 (class 2606 OID 19959)
-- Name: risk_flags risk_flags_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_flags
    ADD CONSTRAINT risk_flags_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- TOC entry 5886 (class 2606 OID 19954)
-- Name: risk_flags risk_flags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_flags
    ADD CONSTRAINT risk_flags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5878 (class 2606 OID 19729)
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(permission_id) ON DELETE CASCADE;


--
-- TOC entry 5879 (class 2606 OID 19724)
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;


--
-- TOC entry 5922 (class 2606 OID 22018)
-- Name: rt_event_offsets rt_event_offsets_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_offsets
    ADD CONSTRAINT rt_event_offsets_consumer_id_fkey FOREIGN KEY (consumer_id) REFERENCES public.rt_consumers(consumer_id) ON DELETE CASCADE;


--
-- TOC entry 5921 (class 2606 OID 21993)
-- Name: rt_event_outbox rt_event_outbox_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_event_outbox
    ADD CONSTRAINT rt_event_outbox_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.rt_event_topics(topic_id) ON DELETE SET NULL;


--
-- TOC entry 5923 (class 2606 OID 22085)
-- Name: rt_webhook_deliveries rt_webhook_deliveries_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_deliveries
    ADD CONSTRAINT rt_webhook_deliveries_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.rt_event_outbox(event_id) ON DELETE CASCADE;


--
-- TOC entry 5924 (class 2606 OID 22080)
-- Name: rt_webhook_deliveries rt_webhook_deliveries_webhook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rt_webhook_deliveries
    ADD CONSTRAINT rt_webhook_deliveries_webhook_id_fkey FOREIGN KEY (webhook_id) REFERENCES public.rt_webhook_endpoints(webhook_id) ON DELETE CASCADE;


--
-- TOC entry 5930 (class 2606 OID 22732)
-- Name: shop_bots shop_bots_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_bots
    ADD CONSTRAINT shop_bots_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(user_id);


--
-- TOC entry 5931 (class 2606 OID 22727)
-- Name: shop_bots shop_bots_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_bots
    ADD CONSTRAINT shop_bots_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id);


--
-- TOC entry 5809 (class 2606 OID 16788)
-- Name: shop_management shop_management_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_management
    ADD CONSTRAINT shop_management_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5810 (class 2606 OID 19042)
-- Name: shop_management shop_management_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_management
    ADD CONSTRAINT shop_management_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE CASCADE;


--
-- TOC entry 5840 (class 2606 OID 19047)
-- Name: shop_payouts shop_payouts_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_payouts
    ADD CONSTRAINT shop_payouts_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE SET NULL;


--
-- TOC entry 5873 (class 2606 OID 19544)
-- Name: stock_transactions stock_transactions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transactions
    ADD CONSTRAINT stock_transactions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5817 (class 2606 OID 16870)
-- Name: system_settings system_settings_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.admins(admin_id);


--
-- TOC entry 5851 (class 2606 OID 19566)
-- Name: user_activity_logs user_activity_logs_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity_logs
    ADD CONSTRAINT user_activity_logs_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE SET NULL;


--
-- TOC entry 5798 (class 2606 OID 18939)
-- Name: user_addresses user_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5891 (class 2606 OID 20797)
-- Name: user_behavior_metrics user_behavior_metrics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_behavior_metrics
    ADD CONSTRAINT user_behavior_metrics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5799 (class 2606 OID 19095)
-- Name: user_favorites user_favorites_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5800 (class 2606 OID 18944)
-- Name: user_favorites user_favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5813 (class 2606 OID 16826)
-- Name: user_management user_management_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_management
    ADD CONSTRAINT user_management_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(admin_id);


--
-- TOC entry 5814 (class 2606 OID 18959)
-- Name: user_management user_management_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_management
    ADD CONSTRAINT user_management_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5892 (class 2606 OID 20829)
-- Name: user_recommendations user_recommendations_recommended_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_recommendations
    ADD CONSTRAINT user_recommendations_recommended_product_id_fkey FOREIGN KEY (recommended_product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5893 (class 2606 OID 20824)
-- Name: user_recommendations user_recommendations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_recommendations
    ADD CONSTRAINT user_recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5801 (class 2606 OID 19100)
-- Name: user_reviews user_reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 5802 (class 2606 OID 18949)
-- Name: user_reviews user_reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 5880 (class 2606 OID 19748)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;


--
-- TOC entry 5881 (class 2606 OID 19743)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5889 (class 2606 OID 20764)
-- Name: user_sessions user_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 5803 (class 2606 OID 18954)
-- Name: user_tokens user_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 5796 (class 2606 OID 19037)
-- Name: users_seller_info users_seller_info_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_seller_info
    ADD CONSTRAINT users_seller_info_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) ON DELETE CASCADE;


--
-- TOC entry 5797 (class 2606 OID 18934)
-- Name: users_seller_info users_seller_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_seller_info
    ADD CONSTRAINT users_seller_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 6170 (class 0 OID 17015)
-- Dependencies: 297
-- Name: orders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 6171 (class 0 OID 17072)
-- Dependencies: 301
-- Name: payments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 6223 (class 3256 OID 22596)
-- Name: ai_alert_escalations tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_alert_escalations USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6213 (class 3256 OID 22597)
-- Name: ai_bias_audit_results tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_bias_audit_results USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6221 (class 3256 OID 22598)
-- Name: ai_budget_alerts tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_budget_alerts USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6222 (class 3256 OID 22599)
-- Name: ai_budget_optimizer tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_budget_optimizer USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6194 (class 3256 OID 22600)
-- Name: ai_campaign_outcomes tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_campaign_outcomes USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6192 (class 3256 OID 22601)
-- Name: ai_churn_predictions tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_churn_predictions USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6198 (class 3256 OID 22602)
-- Name: ai_compliance_alerts tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_compliance_alerts USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6219 (class 3256 OID 22603)
-- Name: ai_cost_forecasts tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_cost_forecasts USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6191 (class 3256 OID 22604)
-- Name: ai_customer_profiles tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_customer_profiles USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6207 (class 3256 OID 22605)
-- Name: ai_decision_events tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_decision_events USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6206 (class 3256 OID 22606)
-- Name: ai_decision_policies tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_decision_policies USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6212 (class 3256 OID 22607)
-- Name: ai_explainability_logs tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_explainability_logs USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6214 (class 3256 OID 22608)
-- Name: ai_fairness_scores tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_fairness_scores USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6211 (class 3256 OID 22609)
-- Name: ai_federated_updates tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_federated_updates USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6188 (class 3256 OID 22610)
-- Name: ai_insight_trends tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_insight_trends USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6202 (class 3256 OID 22611)
-- Name: ai_inventory_forecasts tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_inventory_forecasts USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6190 (class 3256 OID 22612)
-- Name: ai_marketing_insights tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_marketing_insights USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6205 (class 3256 OID 22613)
-- Name: ai_model_performance tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_model_performance USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6199 (class 3256 OID 22614)
-- Name: ai_policy_rules tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_policy_rules USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6201 (class 3256 OID 22615)
-- Name: ai_price_forecasts tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_price_forecasts USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6220 (class 3256 OID 22616)
-- Name: ai_profitability_insights tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_profitability_insights USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6189 (class 3256 OID 22617)
-- Name: ai_recommendations tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_recommendations USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6193 (class 3256 OID 22618)
-- Name: ai_retention_actions tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_retention_actions USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6224 (class 3256 OID 22619)
-- Name: ai_revenue_protection_actions tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_revenue_protection_actions USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6203 (class 3256 OID 22620)
-- Name: ai_rl_feedback tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_rl_feedback USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6204 (class 3256 OID 22621)
-- Name: ai_rl_policy_weights tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_rl_policy_weights USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6208 (class 3256 OID 22622)
-- Name: ai_simulation_runs tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_simulation_runs USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6200 (class 3256 OID 22623)
-- Name: ai_sla_monitoring tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_sla_monitoring USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6210 (class 3256 OID 22624)
-- Name: ai_strategy_evolution_history tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_strategy_evolution_history USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6209 (class 3256 OID 22625)
-- Name: ai_strategy_versions tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.ai_strategy_versions USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6187 (class 3256 OID 22626)
-- Name: alert_queue tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.alert_queue USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6186 (class 3256 OID 22627)
-- Name: alert_rules tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.alert_rules USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6196 (class 3256 OID 22628)
-- Name: audit_access_logs tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.audit_access_logs USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6197 (class 3256 OID 22629)
-- Name: data_retention_jobs tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.data_retention_jobs USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6175 (class 3256 OID 22630)
-- Name: deliveries tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.deliveries USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6181 (class 3256 OID 22631)
-- Name: kpi_anomaly_flags tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_anomaly_flags USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6185 (class 3256 OID 22632)
-- Name: kpi_correlations tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_correlations USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6180 (class 3256 OID 22633)
-- Name: kpi_daily_snapshot tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_daily_snapshot USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6184 (class 3256 OID 22634)
-- Name: kpi_explainability_logs tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_explainability_logs USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6182 (class 3256 OID 22635)
-- Name: kpi_forecast tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_forecast USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6183 (class 3256 OID 22636)
-- Name: kpi_thresholds tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.kpi_thresholds USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6176 (class 3256 OID 21390)
-- Name: orders tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.orders USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6177 (class 3256 OID 22637)
-- Name: payments tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.payments USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6173 (class 3256 OID 22638)
-- Name: products tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.products USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6178 (class 3256 OID 22639)
-- Name: refunds tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.refunds USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6216 (class 3256 OID 22112)
-- Name: rt_webhook_deliveries tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.rt_webhook_deliveries USING ((EXISTS ( SELECT 1
   FROM public.rt_webhook_endpoints w
  WHERE ((w.webhook_id = rt_webhook_deliveries.webhook_id) AND (w.tenant_id = (current_setting('app.tenant_id'::text))::bigint)))));


--
-- TOC entry 6215 (class 3256 OID 22111)
-- Name: rt_webhook_endpoints tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.rt_webhook_endpoints USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6172 (class 3256 OID 22640)
-- Name: shops tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.shops USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6217 (class 3256 OID 22641)
-- Name: sys_audit_log tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.sys_audit_log USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6218 (class 3256 OID 22642)
-- Name: sys_heartbeat tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.sys_heartbeat USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6225 (class 3256 OID 22643)
-- Name: sys_ops_governance tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.sys_ops_governance USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6195 (class 3256 OID 22644)
-- Name: tenant_policies tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.tenant_policies USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6179 (class 3256 OID 22645)
-- Name: tenants tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.tenants USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6174 (class 3256 OID 22646)
-- Name: users tenant_isolation_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY tenant_isolation_policy ON public.users USING ((tenant_id = (current_setting('app.tenant_id'::text))::bigint));


--
-- TOC entry 6169 (class 0 OID 16575)
-- Dependencies: 245
-- Name: users; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Completed on 2025-10-26 21:15:38

--
-- PostgreSQL database dump complete
--

\unrestrict NCZYmPlAcQWwx5DUXqblNNZImQ6xEFVEsbHpOiLiCHwzMtDQyBW8SV7MrElYoYA

-- Completed on 2025-10-26 21:15:38

--
-- PostgreSQL database cluster dump complete
--


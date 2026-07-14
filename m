Return-Path: <ksummit+bounces-2966-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LD2MB5jMVmo9BQEAu9opvQ
	(envelope-from <ksummit+bounces-2966-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 15 Jul 2026 01:56:08 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69697759870
	for <lists@lfdr.de>; Wed, 15 Jul 2026 01:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hhqtgCjg;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2966-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2966-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA3543069963
	for <lists@lfdr.de>; Tue, 14 Jul 2026 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0860B43304C;
	Tue, 14 Jul 2026 23:55:02 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87552366DA3
	for <ksummit@lists.linux.dev>; Tue, 14 Jul 2026 23:55:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073301; cv=none; b=pHA7zjOw1v6NvBfRyCx76LmcZRgnYWDzUnIm5adtFa7/IvuunViINzVuM8xwKdy8q/PN80f9KzFluU7KTuNySZ4TjQ5eZp1TmAbHkF3itW0P4pFpAVeIlrOuLYUDXOd3lNfyI0x50Yc1OrT3A4/cq2qbd1DQ09tStGFC+90hrNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073301; c=relaxed/simple;
	bh=2tKQYzV7DMMDRoeebKIKXQGdq0UGbKUF2kpZgtzBVvI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/dheQkkBuGER9xVLuUZ/DrqiO5YsLAyt0vukJLmMUbkr2q2hJh+HI+XuF9PamIlFEyf8rtxqNxJOBCF3kkMaRf3Bq9JnO+grkn6NSmFGmzd/TpJou5OkgvQ0ngGT6kDM2ZvnHIcbMcAuucmgn6u7tETkgSwqxDgqXchOJLuaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhqtgCjg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E193F1F000E9
	for <ksummit@lists.linux.dev>; Tue, 14 Jul 2026 23:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784073300;
	bh=nNxJ3h1O/85lHQgQhk6JZglznxtwnmxZEdxjD0eJ9XY=;
	h=Date:From:To:Subject;
	b=hhqtgCjgZI31zqdGiWd+iy4Xm8TngaS8KGbgSLbecMLF+90ZPuHRXT6/3wUGLe70v
	 f+7NK+KsNy75WdXYQkAH5EfphYWVwz7tVECAQPdPhUQ4oKixZ1uuw0lT6MM1FxAwfN
	 plU94DxWfwnFgvM1o+xx9bJKd/KLbACmn0kP7zBZ5kdx1zMkEhYnruiBnajfZ9fsx2
	 KYVZR8bjHw4wiyMwtAz7O8UIcIXEHhm+132CeudaALYjgHvwhJdqt6RZF+tCV/Y5hP
	 ko5z/hPrf0AQauVHoDKwMenlSHDHlEh6xSt4fmrynkZshd8iQFeg1/Xovcon6GGpli
	 ueVy+VTDavlvg==
Date: Tue, 14 Jul 2026 19:54:58 -0400
From: Sasha Levin <sashal@kernel.org>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Scaling our security process
Message-ID: <albMUqack9yMq0rF@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2966-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:from_smtp,laps:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69697759870

Hi folks,

As everyone might have noticed by now, LLMs are finding real, exploitable bugs
at a growing rate, and the same tools are available to people who won't report
what they find. At the same time we're getting a stream of plausible looking AI
slop that wastes reviewer time.

Clearly this is not kernel-specific, but given where the kernel sits in the
stack this creates more of a problem for us. We spent decades saying security
by obscurity doesn't work and that being open makes us more secure. In practice
we leaned a bit on a version of it anyway: security by complexity. The code was
public, but it was complicated enough, and there was so much of it, that
finding a serious bug took rare skills and a lot of time. AI removes that
barrier. What's left is how fast we triage, fix, and ship.

With that in mind, I'd like to discuss:

1. Does security@ still work? It was built for a handful of carefully written
reports, handled start to finish by a small group of volunteers. That process
never really scaled before, and it won't scale now. Does it make sense to
separate the roles? let AI driven tooling handle intake, filtering, and
reproduction, and keep the humans for developing and coordinating fixes for
reports that survive triage?

2. Where does stable@ fit? Landing a fix upstream and calling it a day helps
nobody. Our users don't run mainline; they benefit when the fix shows up in the
kernel they actually run. Today a fix that goes through security@ often lands
in Linus's tree with no stable tag and no backport, sometimes not even to
recent LTS trees. If a security fix isn't in the LTS trees, is the bug actually
fixed? And should folks who care about these backports be in the loop while the
fix is being developed instead of finding out after the fact?

3. Do we want some sort of a shared distro security backport list? Every major
distro pays people to backport security fixes, and they all do the same work in
parallel behind separate walls. A list where upstream and distro security teams
write and review backports together, would pool that effort and land fixes
where users are. Sure, it allows for more leaks, but we end up causing these
leaks ourselves when we release a fix without working backports.

4. How can CVE tracking better serve our users? We assign a lot of CVEs, and
the common complaint is that consumers can't tell which ones matter for the
kernel they actually run. The CVE program's SADP pilot points at one answer:
downstream suppliers attach "affected / not affected / fixed in X" status
directly to upstream CVE records. Do we want to push the ecosystem in that
direction, and what should the kernel CNA provide to make it easy?

5. Do we need a policy on AI generated reports and patches? Other projects have
one. Can we tell AI assisted quality work from slop without burning out the
people doing triage?


I'd really want to steer away from the "AI is good/evil" discussion, and just
focus on the reality we have all seen through the past year or so.

-- 
Thanks,
Sasha


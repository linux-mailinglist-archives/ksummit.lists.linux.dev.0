Return-Path: <ksummit+bounces-2921-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K5HtLCN1IWoIGwEAu9opvQ
	(envelope-from <ksummit+bounces-2921-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 04 Jun 2026 14:52:51 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D43640111
	for <lists@lfdr.de>; Thu, 04 Jun 2026 14:52:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hB1OIHYu;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2921-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2921-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B446A3010BD1
	for <lists@lfdr.de>; Thu,  4 Jun 2026 12:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D659D43D4F4;
	Thu,  4 Jun 2026 12:52:47 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8807725487C
	for <ksummit@lists.linux.dev>; Thu,  4 Jun 2026 12:52:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577567; cv=none; b=gdx740tlrdBXPw8KsXMUg0OJ1FEyZ01dTC1sLFAHg6COs6uavk1nZ8vxHvChFtQJor8OQOnqXOPfKVGj8nBSBuTzJE3nFm3WITyitKJQlPMOfbIU2Lb1XDpb6nj4vbI7atjOn+QHTEMeDk9LLN97dyBOEZMR5cXrzJqbI+8A6ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577567; c=relaxed/simple;
	bh=9j8nEeGPEAXu0DIlTPMxduKX6ImwOZVcfJoq7YrHZE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1Yl2BZgvS9VfvxcQTwm5ijkvZX0sdF3DQK2ayLR5i3x5UOaQLCnr2aPp9x3QjuXXO2eGvwbLQ9x44BwoaGK2lg195RCyGYCaGTVPpj7ySabzxCDdPmOnD9pBYchry9ov+Vp/m+dWjGeQIDI2Zs4eje7IukLSYajl0ZSmwm5Wmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB1OIHYu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BD81F00893;
	Thu,  4 Jun 2026 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577566;
	bh=9j8nEeGPEAXu0DIlTPMxduKX6ImwOZVcfJoq7YrHZE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hB1OIHYutWZhpn/8O1iONBN7KlV3nmwpDtijVvUcDikfqg4BA/1QMV5TzhJTyXKHV
	 zPHnzXnfd6fJ+IE4H+z2iGj/gThUTNkqCq4PA7VGMswxNbYwmx7SxNdmT03C1IB26k
	 wm/cVvY+hMNKy4rPJBmuuXeMu7hCtMNh/Q0rar8Gtiq/ihiqOeKeEZVaSnp8svQLwL
	 i4TG0DZsYCvSgPCU3w/fwChuJH5HeqxUjZ81OcgA2ccf2WMpGCNqDuFoGWilHPEYpO
	 H2JAMag9bRXwJO6bcKGykMocGKL7VngkiAZ8I/LfrfOyZRyHcuuE8K347cNj25eAws
	 pmO9RLyy+GrMg==
Date: Thu, 4 Jun 2026 14:52:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: ksummit@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
Message-ID: <20260604-grinning-determined-falcon-0e8b01@houat>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yfeno57jjn5o3ysy"
Content-Disposition: inline
In-Reply-To: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-2921-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48D43640111


--yfeno57jjn5o3ysy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
MIME-Version: 1.0

Hi,

On Tue, May 26, 2026 at 09:41:18AM +0200, Neil Armstrong wrote:
> Since the introduction of the first Samsung DSI panel, the Linux DRM panel
> API has been a crucial piece of software for enabling displays across
> diverse architectures, but it has not evolved alongside modern graphics s=
tacks.
> Currently, the API lacks atomic DRM API support and the ability to adapt
> power setups during mode changes.
> Furthermore, it fails to support advanced Display Driver IC (DDIC) featur=
es
> that modern hardware heavily relies on, including:
> - Standby and advanced power states
> - Advanced color management
> - Dynamic rate switching
> - Command mode self-refresh
>=20
> This lack of evolution has led to severe fragmentation between
> upstream and vendor downstream trees for advanced devices support,
> creating a heavy maintenance burden and making native hardware support
> incredibly difficult.
>=20
> The goal would be to outline these architectural limitations and
> trigger a discussion on how to collaboratively modernize the panel
> API. By standardizing advanced DDIC capabilities and fully embracing
> the atomic DRM API, we hope to establish a unified path forward for
> the entire Linux community.

I acknowledge it might sound a bit like "let's burn the whole thing to
the ground", but what you just described sounds an awful lot like what
the bridge API already does.

Let's acknowledge that drm_bridge isn't just about bridge anymore, make
panels bridges, and we're done.

The main problem with panels imo is how obscure they are, and are pretty
much fire-and-forget for panel vendors, so they have no incentive to
spend time upstreaming.

It really feels like a similar position compared to what HID was, and I
wonder if doing a dumb bridge driver for panels with ebpf support so we
can put all the panel quirks in userspace like HID-BPF would be the way
forward.

Maxime

--yfeno57jjn5o3ysy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiF1GwAKCRAnX84Zoj2+
doHDAYCBrqL1buzgpRurHrXaL+cL4+HJpKsrwXtj7pMKZDN7mPnwvqRT46OpoGZs
VAU0rVcBf2E56OIzP5+kRl6+YsiAWI0cPo+if10j3AqdfDOwJrllfksj6waujVtc
ze7YMspSDA==
=3Jk9
-----END PGP SIGNATURE-----

--yfeno57jjn5o3ysy--


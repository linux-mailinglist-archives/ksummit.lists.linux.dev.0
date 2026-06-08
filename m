Return-Path: <ksummit+bounces-2924-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5+KMWCZJmreZQIAu9opvQ
	(envelope-from <ksummit+bounces-2924-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 08 Jun 2026 12:28:48 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F5655147
	for <lists@lfdr.de>; Mon, 08 Jun 2026 12:28:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JpCQA19t;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2924-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2924-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 941783432797
	for <lists@lfdr.de>; Mon,  8 Jun 2026 10:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C33B7B64;
	Mon,  8 Jun 2026 10:17:56 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B43A9612
	for <ksummit@lists.linux.dev>; Mon,  8 Jun 2026 10:17:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913875; cv=none; b=iCIwVGLwOAymBa4blt2mR8rg+E5WbbXlxXkowAqH2+TQgYLMqiQYChl9CYp7zAlHjZI9/S1i9P2JLCq3bg0AuRRkrQpJou6766cJj8N8aFc25PkkZvqzPZ/SV3kJbwfd/5XS5K0wbVTDIrPBfSpJQEqc8WxJI5qMhFGVSkG/YMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913875; c=relaxed/simple;
	bh=lgs4owIT5dmwepSM7gynT5mXCUHdD+Lxd3EnbDTBdDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Orp/+PN1ydKTPFviGmU8enACM1QT52ELkNV0bf6rNq3WeMs1pMDamIeatatjrhv+RSISuA5rx8JGY1XS5JLY5AyLbSYCA79xfIepclkS+/rMMDNGZFIaBoAaIdyDHpW/G5l5GW3+TP0th9ftrFV3pCQvHlHxjjF9wQsWbRP5OXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpCQA19t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B611C1F00893;
	Mon,  8 Jun 2026 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913874;
	bh=lgs4owIT5dmwepSM7gynT5mXCUHdD+Lxd3EnbDTBdDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JpCQA19tWVKKIM095piR3SAhm2ZFrI4VHWr6QrHOIjWf+zLQCH9A6bYp5QRYJ7/wv
	 vWwCKKjVVFRxOREbLTZzfheOl9AaDdNuHxU9ov6rFQfkDAPYW1J/YkGtX1PUnYgIW2
	 PY0GfG+ohHU0xHSBGZBgjqgkbuCabB+VoqblLRsUCG6+q9nSqcn0o/b+5zzuo+hPnG
	 koN/81NtzkJaehEGA0FoLbrO/TRO97KyqBEsuCCDpRPaIR2sjpstz04kdfDOv56RNE
	 M3FonlW30smYApHLiftTNb3dzbKh0LnFu/0fJ5CNBgaVumqo+XH1swz1Q6NOKfEB4t
	 YUKvRQwoKkZzA==
Date: Mon, 8 Jun 2026 12:17:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: ksummit@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
Message-ID: <20260608-esoteric-hilarious-spider-2d2cac@houat>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <20260604-grinning-determined-falcon-0e8b01@houat>
 <8d0a958c-2eaa-470d-b81f-3a6c436b8a7f@linaro.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7xvaftgdmy6oaecd"
Content-Disposition: inline
In-Reply-To: <8d0a958c-2eaa-470d-b81f-3a6c436b8a7f@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-2924-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,houat:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 221F5655147


--7xvaftgdmy6oaecd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
MIME-Version: 1.0

On Thu, Jun 04, 2026 at 03:00:59PM +0200, Neil Armstrong wrote:
> Hi,
>=20
> On 6/4/26 14:52, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, May 26, 2026 at 09:41:18AM +0200, Neil Armstrong wrote:
> > > Since the introduction of the first Samsung DSI panel, the Linux DRM =
panel
> > > API has been a crucial piece of software for enabling displays across
> > > diverse architectures, but it has not evolved alongside modern graphi=
cs stacks.
> > > Currently, the API lacks atomic DRM API support and the ability to ad=
apt
> > > power setups during mode changes.
> > > Furthermore, it fails to support advanced Display Driver IC (DDIC) fe=
atures
> > > that modern hardware heavily relies on, including:
> > > - Standby and advanced power states
> > > - Advanced color management
> > > - Dynamic rate switching
> > > - Command mode self-refresh
> > >=20
> > > This lack of evolution has led to severe fragmentation between
> > > upstream and vendor downstream trees for advanced devices support,
> > > creating a heavy maintenance burden and making native hardware support
> > > incredibly difficult.
> > >=20
> > > The goal would be to outline these architectural limitations and
> > > trigger a discussion on how to collaboratively modernize the panel
> > > API. By standardizing advanced DDIC capabilities and fully embracing
> > > the atomic DRM API, we hope to establish a unified path forward for
> > > the entire Linux community.
> >=20
> > I acknowledge it might sound a bit like "let's burn the whole thing to
> > the ground", but what you just described sounds an awful lot like what
> > the bridge API already does.
>=20
> Precisely, but still panels are not like "connectors" where the actual di=
splay
> panel is something managed by the display microcontroller firmware.

I'm sorry, but I don't get what you're saying. What's the relationship
between panels (or bridges?) and a display microcontroller firmware? Or
a display microcontroller firmware and KMS in general?

> > Let's acknowledge that drm_bridge isn't just about bridge anymore,
> > make panels bridges, and we're done.
>=20
> Yes, and no, those panel-bridges will still have a lot of common boilerpl=
ate
> that lies in the panel API today,

What boilerplate? the panel API itself is pretty much only
enable/disable/get_modes. bridges have that too, and then some.

> but those could be moved as helpers and remove the panel API entirely.
> And this won't solve how we implement advanced features...

No, but you'll be able to implement the advanced features with the
access to drm_atomic_state (and drm_bridge_state) bridges give you.

> > The main problem with panels imo is how obscure they are, and are pretty
> > much fire-and-forget for panel vendors, so they have no incentive to
> > spend time upstreaming.
>=20
> As Linus, Doug and Dmitry replied already, this is our biggest issue and =
not
> only Linux maintainers issues but also product makers like Open Linux pho=
nes
> which can only discuss with panel makers and are unable to match the down=
stream
> Android capabilities.

The best we can do for this though is to provide the infrastructure for
them to contribute. We can't do more than that, or force them to
contribute, or release doc, or...

> > It really feels like a similar position compared to what HID was, and I
> > wonder if doing a dumb bridge driver for panels with ebpf support so we
> > can put all the panel quirks in userspace like HID-BPF would be the way
> > forward.
>=20
> I don't visualize this proposal, could you elaborate ?

You can create a "generic" bridge driver, and anything out of the
regular MIPI-DSI power sequence is implemented through an optional eBPF
hook.

Maxime

--7xvaftgdmy6oaecd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaWzwAKCRAnX84Zoj2+
doZeAYC+YG7E8vMRfwAnJPUg71o1SAIvLtNVeTvlMCer2SLmbxlVVKeaBZnoultW
4ZBvjVoBf1nGpX2J6ZFx2dIz5BzYJ8MQwwXJ9GgF9byYtydUf//iUYhJusbo/81x
54aNf51cwQ==
=3B0/
-----END PGP SIGNATURE-----

--7xvaftgdmy6oaecd--


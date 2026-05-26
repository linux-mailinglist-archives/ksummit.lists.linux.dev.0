Return-Path: <ksummit+bounces-2914-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPvpMpRpFWrgUwcAu9opvQ
	(envelope-from <ksummit+bounces-2914-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 26 May 2026 11:36:20 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5395D36CE
	for <lists@lfdr.de>; Tue, 26 May 2026 11:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F6C0307FA89
	for <lists@lfdr.de>; Tue, 26 May 2026 09:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7763D79E3;
	Tue, 26 May 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbXlZHYi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E920738CFEE
	for <ksummit@lists.linux.dev>; Tue, 26 May 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787835; cv=none; b=MS+3weEK+AGxR54TUIr8aeVsdolS0PREEfQR4b0JYvoxgOpGoKfBnNj5rWQAx5sEcwO9TlVep/R2Zmk2NcP0oU5Sdhe3kpi9px2nZ48RNSQTyTCBA45MDmxtISfY7UlCsz3mOQydgaDwznyZ7seiSwd6CUe+pd89uH5XPdCcsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787835; c=relaxed/simple;
	bh=eHRTPCNHrk6eDGvRoxnQRQ+2klTdLEGutgll1FypAYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fY8x2FcNqstAfaqxQDc7jQpSgCI/8QuZItnkRVEbHQ+eW1vDIeImSZipPxxzmnT8OJq1CL4QCbOHCfXAsPdOUylc/dZOSgRgMWQbigh7i20FZEwO0ByOYhx/d2G2Xmkhwiq9kCotkOy4JocmhB5ISrpAMUfRE3LEeC5b2UpDOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbXlZHYi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FAA1F00A3D
	for <ksummit@lists.linux.dev>; Tue, 26 May 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787832;
	bh=PPSj4T/WTidhPMCzPd75gN6Ts3UI95FBgpmSJZ1Jcw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cbXlZHYiKDL5khKTjS6n//FsdYVBFqac8qxnbSUUKsF0gpPX+fWZzBnjbT/B43ZCM
	 eL+2ZAlvbBbqXGaszNcprdOjmKS7mCDS9ntNCBCKJeonwPjkmq+2b3h3AfuBRZ6OGX
	 /cueSCTxLjZtot/KWhNlGQiOPmJ5eBxAsVBHv/f5o/GbHKeuohEOWdGnxHYl0WSTHw
	 dbQRCEuOXhk4UPZj0GNF8UD4LIEJsIan5Exv4O1s8FN7HuDxV8Lqy7Z7PgIQzD1QMT
	 t+MOqd4/JNkAGwL8ilIlpWTKfxlf58jHCkaWHgm4VrRSrZymHl5iPoXhjY8KiCx2nD
	 L4hBc+1osr6OA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8738c178dso9074639e87.1
        for <ksummit@lists.linux.dev>; Tue, 26 May 2026 02:30:32 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw93+9GGELsj3fDWu09eLakAjk6jx5zgfwihE5umVoX8+Ljcd+T
	7uh1yzjzPEEh2w2FOaxj5vJUmVJBKk/X0whSdaUf/HpkEkfMLK0LA8TztpUbhN1LsaWIYDiJHRi
	HcK31+Yo8mfeMsCkuXByBZno41hHbfgE=
X-Received: by 2002:a05:6512:3d05:b0:5a8:73c3:f27b with SMTP id
 2adb3069b0e04-5aa323b28c4mr4823182e87.15.1779787831516; Tue, 26 May 2026
 02:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
In-Reply-To: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:30:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
X-Gm-Features: AVHnY4JIkKZ3ceN6xsYvCesnxfHYhTEB7gyNkmFqh39LdK-yWO9M5rO_AzHYnaI
Message-ID: <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern age
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: ksummit@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2914-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 2A5395D36CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Neil,

I support this topic. I have hesitated to sign up as panel maintainer mainl=
y
because I have too much other stuff to do.

One thing we need to discuss is the hostility or active disinterest of
panel IC vendors to the Linux community, or maybe to all their customers.
My general impression is that they rarely publish datasheets, and if so
under NDA, and their idea of a driver is a bunch of opaque custom
commands sent during panel start-up and other infliction points.

Has there ever been a single kernel commit directly from a panel IC
company such as Novatek, Ilitek, Samsung (their panel business unit,
not Samsung mobile), etc?

Do we have any indication that there is interest from the companies
actually doing display controllers?

My view of them is that they seem to be a bunch of company in
Asia who are deeply suspicious of each other and just think their
competitors will copy everything they do, but this may be prejudice
from my side.

On Tue, May 26, 2026 at 9:41=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> Furthermore, it fails to support advanced Display Driver IC (DDIC) featur=
es
> that modern hardware heavily relies on, including:
> - Standby and advanced power states

There are at least some standard DCS commands for this.

> - Advanced color management

For example panel-novatek-nt35510.c, my most ambitious driver:

/*
 * These gamma correction values are 10bit tuples, so only bits 0 and 1 is
 * ever used in the first byte. They form a positive and negative gamma
 * correction curve for each color, values must be strictly higher for each
 * step on the curve. As can be seen these default curves goes from 0x0001
 * to 0x03FE.
 */
#define NT35510_GAMMA_POS_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
                0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01,=
 \
(...)
#define NT35510_GAMMA_NEG_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
                0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01,=
 \
(...)
        /**
         * @gamma_corr_pos_r: Red gamma correction parameters, positive
         */
        u8 gamma_corr_pos_r[NT35510_P1_GAMMA_LEN];
        /**
         * @gamma_corr_pos_g: Green gamma correction parameters, positive
         */
        u8 gamma_corr_pos_g[NT35510_P1_GAMMA_LEN];
        /**
         * @gamma_corr_pos_b: Blue gamma correction parameters, positive
         */
        u8 gamma_corr_pos_b[NT35510_P1_GAMMA_LEN];
        /**
         * @gamma_corr_neg_r: Red gamma correction parameters, negative
         */
        u8 gamma_corr_neg_r[NT35510_P1_GAMMA_LEN];
        /**
         * @gamma_corr_neg_g: Green gamma correction parameters, negative
         */
        u8 gamma_corr_neg_g[NT35510_P1_GAMMA_LEN];
        /**
         * @gamma_corr_neg_b: Blue gamma correction parameters, negative
         */
        u8 gamma_corr_neg_b[NT35510_P1_GAMMA_LEN];

(...)
        /* Default gamma correction values */
        .gamma_corr_pos_r =3D { NT35510_GAMMA_POS_DEFAULT },
        .gamma_corr_pos_g =3D { NT35510_GAMMA_POS_DEFAULT },
        .gamma_corr_pos_b =3D { NT35510_GAMMA_POS_DEFAULT },
        .gamma_corr_neg_r =3D { NT35510_GAMMA_NEG_DEFAULT },
        .gamma_corr_neg_g =3D { NT35510_GAMMA_NEG_DEFAULT },
        .gamma_corr_neg_b =3D { NT35510_GAMMA_NEG_DEFAULT },

I have added driver support for this based on the code drops from Novatek.

So what we want is being able to actually adjust these curves, like we
do for professional monitors.

However without the datasheet how am I supposed to do anything with this?
I can't just trial-and-error such stuff. Novatek need to back any attempts
and provide feedback to do such stuff.

I guess adding gamma correction to the panel frameworks and using
the existing infrastructure in DRM for this is our problem, but then we at
least need to know what we are doing.

> - Dynamic rate switching
> - Command mode self-refresh
>
> This lack of evolution has led to severe fragmentation between upstream
> and vendor downstream trees for advanced devices support, creating a heav=
y
> maintenance burden and making native hardware support incredibly difficul=
t.

How do these vendor trees look?

I'm curious. What I expect is more blobs of random hex digits without
explanation writing magic into the display IC and named do_the_stuff().
But maybe there are actually some real first class citizens here with
proper structured drivers and a datasheet to back the code up?

Yours,
Linus Walleij


Return-Path: <ksummit+bounces-2920-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3bzuBkE8IWpwBgEAu9opvQ
	(envelope-from <ksummit+bounces-2920-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 04 Jun 2026 10:50:09 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893B63E26B
	for <lists@lfdr.de>; Thu, 04 Jun 2026 10:50:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d+evXqpN;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2920-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2920-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 993DA304A8C2
	for <lists@lfdr.de>; Thu,  4 Jun 2026 08:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9BF3E51EE;
	Thu,  4 Jun 2026 08:39:42 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4323E2ABF
	for <ksummit@lists.linux.dev>; Thu,  4 Jun 2026 08:39:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562381; cv=none; b=o2gTqI1yiPneQg2CRncL3U1IihPR4uieHQNyxplmq/PE8rU4IU+MWbb9GfUsSqVsvRA4mQSsS9yZfovWTd1tkmRrNqlxwOVPMmY8adfEqy7p0+6GUgoHqGIcathspUB5ib0pqzE3Qwv0NL31mz7qBKlDG9CKVXSOrj3vEiqFbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562381; c=relaxed/simple;
	bh=ayV24kuyulAnsg8vtRj9pImFZgZShIyj3RS1YJguujk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHTfTXYJ+WWkXthlCMLOKgB53SAHEOjtVJrJqr/TwSYah9hlV59zESKPB8bNw2ZWaDISmqu2e2qzzuydt6lZXyxe1nRJLXXr/hYhRsmGMPrNaN8JkYQt+BmUe26gBY3xL1HNdECZlRKnR9myd7Sk4EsQuVRZXtrFgBBvrtmNYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+evXqpN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397291F0089D
	for <ksummit@lists.linux.dev>; Thu,  4 Jun 2026 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562378;
	bh=ayV24kuyulAnsg8vtRj9pImFZgZShIyj3RS1YJguujk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d+evXqpNJtOzaGdxvlVsp/DblSnp/SrulvLe43DCJXNeHlyxMVvpjMbRVDPcOXuvg
	 0mtq2IkTWPltWjiUGln2WO9JDhkQH3SYKM7dpDm5JOu5+N19JXKrrbCBwQ638UFKd0
	 gGyRySr6SdXBl7H8IE5m0fneNiQuwCW8wY5WgZjQ3agQVcBs6PMRksQu7M9luKx9X9
	 yCM4KjjYBsuHp8/7cVrUZ/2Fv18fN4au0Nwr1Eah/ifOhHjlrSlgL5NVdzRo5SfZME
	 WPVldbjgrmd2ayW6D+Vd6dSm1MaPsDVOPlGjObk4eGvBntcofWPeY73fXa8h/71nTc
	 uu6RGptCp+Zvw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39677245e15so3472891fa.1
        for <ksummit@lists.linux.dev>; Thu, 04 Jun 2026 01:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9iTMQADDX2yDk2yEkCU+YR9E7ZaH+aZEmOdxIUk0qGg6ED/rv7aR3jmZMWG6wzBO/aR5QJ/4Qb@lists.linux.dev
X-Gm-Message-State: AOJu0YzXPlWYqCwkKAL1nhxRpDCfCDVbZFmTvfxzCD8bfl/iBYU4saul
	32GeLHd3SVrXRLW1fz6LUi6m+MHLOuv4aBPs/PMdKKAWwmTTWLzjN81gaDeQA78G2P5fOovukET
	4y0PH1E6zDp9bCndyFBVjF06+YlkeAZU=
X-Received: by 2002:a2e:a901:0:b0:38c:63df:82a2 with SMTP id
 38308e7fff4ca-396af52fd55mr25464331fa.27.1780562376902; Thu, 04 Jun 2026
 01:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
 <45bfff63-3584-4228-929d-38722f1c564b@linaro.org> <6eb7200a-4e5c-4cb3-ad21-85ed9c477338@oss.qualcomm.com>
In-Reply-To: <6eb7200a-4e5c-4cb3-ad21-85ed9c477338@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Jun 2026 10:39:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPP49A6E3hbyR9R6Y7P=Zy1rOHqCztj3uRtDHUfDQBVg@mail.gmail.com>
X-Gm-Features: AVVi8Cc_AbzCxyzjcMkPq6eAJAfanED5GukVW3A7YebzaqLJ4UVIQhYevnqKkds
Message-ID: <CAD++jLnPP49A6E3hbyR9R6Y7P=Zy1rOHqCztj3uRtDHUfDQBVg@mail.gmail.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern age
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, ksummit@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Ping Cheng <pingc@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-2920-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6893B63E26B

On Thu, Jun 4, 2026 at 12:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> > I agree, but on the Camera Sensor side they had the same issue and star=
ted
> > speaking directly to some vendors which actually accepted to provide do=
cs
> > and even write sensors drivers themselv es.
>
> Unfortunately, for display panels you need two counter parties, the DDIC
> vendor and the glass / panel vendor, with the panel vendor usually
> having the NDA with the DDIC vendor.

This has been my impression as well, the two-layered structure
of the supply chain DDIC -> panel vendor -> system vendor
complicates things.

> >> Do we have any indication that there is interest from the companies
> >> actually doing display controllers?
> >
> > They mainly speak to panel makers so I don't think they really care.
>
> We have been going through this for all other classes of hardware. What
> would be the selling point that would make panel vendor learn about the
> upstream Linux process?

The unique selling point would be a vendor that deliver professional
equipment and which require full control over the display, i.e. full
gamma correction for example.

A typical such vendor would be Wacom.

These tablets have excellent input device support in Linux thanks
to Wacom working for years with the community, but most if not all
of their devices these days are panels that you draw directly onto,
so they are a panel and an input device.

I don't know how much control they have over the deep
aspects of the display today, I would expect at least factory
calibration but that may be done with separate (non-linux)
tooling. But certainly lifetime color correction is something
I think they already support albeit possibly with custom tools?

Cc to Jason & Ping to check if they have an interest in this.

Yours,
Linus Walleij


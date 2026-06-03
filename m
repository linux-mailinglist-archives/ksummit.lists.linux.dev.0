Return-Path: <ksummit+bounces-2918-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 26z1G+2ZIGqd5gAAu9opvQ
	(envelope-from <ksummit+bounces-2918-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 03 Jun 2026 23:17:33 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499C63B5A1
	for <lists@lfdr.de>; Wed, 03 Jun 2026 23:17:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=FJpQD3Pu;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2918-lists=lfdr.de@lists.linux.dev" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2918-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6246F3011F73
	for <lists@lfdr.de>; Wed,  3 Jun 2026 21:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C134968FC;
	Wed,  3 Jun 2026 21:17:21 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A13A8F7
	for <ksummit@lists.linux.dev>; Wed,  3 Jun 2026 21:17:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521440; cv=none; b=cjxt4sKYVD7gshlb7BcBTV2tVOyOrI+ML+Qg5MFqr6JpYnYWO2P+S6yRyMZM6FkX3PQMkPQgCpO81jM7IK0W0VzJJ8tFx9v9Rfj1K6VrFf2eFKIpZmHyPXIm0rbdrYcK445U8qztzc3RuSXRsWkkffgUP98y/P/KKCO3f6KgktE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521440; c=relaxed/simple;
	bh=Y3/bnWTdc1LKJRqzQslkQJdZGD5kYFkQlGZV4IpOuOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYhruxJ6d+QnQsZd++ihdFiXGYRAf+8VTDXVFxCzrx+2S25GUbN0uZsohFES8nC1qTjVtZuJbnXr3HXVo7TGpjVARhLML6Gh+Gw6HXmDvIleAh0YH3QSR1+XVcqEW2NTqGRtxsvaP4HU5Ne3EKWr3mfeUteHZuFItbWFuL2kCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJpQD3Pu; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (85-76-49-85-nat.elisa-mobile.fi [85.76.49.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A75B5B3;
	Wed,  3 Jun 2026 23:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780521407;
	bh=Y3/bnWTdc1LKJRqzQslkQJdZGD5kYFkQlGZV4IpOuOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJpQD3PuGUlLmaJT/dm53QeUNhJsCoAft49DUnFSDetiYrQfCyVu8Bn/hUwlS8hOc
	 IygG2rR5kDrYDSn8FdoZtKeIn2gw3lh1GOVw0V+V/u7/wiLq0496Fq6vxZMPqSRC4+
	 36KcbIk+SUlD/UtPGsX3bOnS/9+FRJi8BQGMoQlc=
Date: Thu, 4 Jun 2026 00:17:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, ksummit@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
Message-ID: <20260603211709.GH684535@killaraus.ideasonboard.com>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
 <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2918-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:from_mime,ideasonboard.com:dkim,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6499C63B5A1

On Wed, Jun 03, 2026 at 10:10:10AM +0200, Neil Armstrong wrote:
> On 5/26/26 11:30, Linus Walleij wrote:
> > Hi Neil,
> > 
> > I support this topic. I have hesitated to sign up as panel maintainer mainly
> > because I have too much other stuff to do.
> > 
> > One thing we need to discuss is the hostility or active disinterest of
> > panel IC vendors to the Linux community, or maybe to all their customers.
> > My general impression is that they rarely publish datasheets, and if so
> > under NDA, and their idea of a driver is a bunch of opaque custom
> > commands sent during panel start-up and other infliction points.
> 
> I agree, but on the Camera Sensor side they had the same issue and started
> speaking directly to some vendors which actually accepted to provide docs
> and even write sensors drivers themselv es.

They key was showing vendors that providing documentation and support
(even if under NDA) to developers who write and upstream clean drivers
is in their business interest. I don't have enough insight in the panel
market to tell if the arguments that convinced camera sensors vendors
are directly applicable.

> > Has there ever been a single kernel commit directly from a panel IC
> > company such as Novatek, Ilitek, Samsung (their panel business unit,
> > not Samsung mobile), etc?
> 
> Not that I'm aware of.
> 
> > Do we have any indication that there is interest from the companies
> > actually doing display controllers?
> 
> They mainly speak to panel makers so I don't think they really care.
> 
> > My view of them is that they seem to be a bunch of company in
> > Asia who are deeply suspicious of each other and just think their
> > competitors will copy everything they do, but this may be prejudice
> > from my side.
> 
> Yes, but if we could speak to the DDIC makers directly to support those
> in a generic way, we could simply take the panel parameters from the ODM
> which got them from the panel makers.
> 
> > On Tue, May 26, 2026 at 9:41 AM Neil Armstrong wrote:
> > 
> >> Furthermore, it fails to support advanced Display Driver IC (DDIC) features
> >> that modern hardware heavily relies on, including:
> >> - Standby and advanced power states
> > 
> > There are at least some standard DCS commands for this.
> > 
> >> - Advanced color management
> > 
> > For example panel-novatek-nt35510.c, my most ambitious driver:
> > 
> > /*
> >   * These gamma correction values are 10bit tuples, so only bits 0 and 1 is
> >   * ever used in the first byte. They form a positive and negative gamma
> >   * correction curve for each color, values must be strictly higher for each
> >   * step on the curve. As can be seen these default curves goes from 0x0001
> >   * to 0x03FE.
> >   */
> > #define NT35510_GAMMA_POS_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
> >                  0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
> > (...)
> > #define NT35510_GAMMA_NEG_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
> >                  0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
> > (...)
> >          /**
> >           * @gamma_corr_pos_r: Red gamma correction parameters, positive
> >           */
> >          u8 gamma_corr_pos_r[NT35510_P1_GAMMA_LEN];
> >          /**
> >           * @gamma_corr_pos_g: Green gamma correction parameters, positive
> >           */
> >          u8 gamma_corr_pos_g[NT35510_P1_GAMMA_LEN];
> >          /**
> >           * @gamma_corr_pos_b: Blue gamma correction parameters, positive
> >           */
> >          u8 gamma_corr_pos_b[NT35510_P1_GAMMA_LEN];
> >          /**
> >           * @gamma_corr_neg_r: Red gamma correction parameters, negative
> >           */
> >          u8 gamma_corr_neg_r[NT35510_P1_GAMMA_LEN];
> >          /**
> >           * @gamma_corr_neg_g: Green gamma correction parameters, negative
> >           */
> >          u8 gamma_corr_neg_g[NT35510_P1_GAMMA_LEN];
> >          /**
> >           * @gamma_corr_neg_b: Blue gamma correction parameters, negative
> >           */
> >          u8 gamma_corr_neg_b[NT35510_P1_GAMMA_LEN];
> > 
> > (...)
> >          /* Default gamma correction values */
> >          .gamma_corr_pos_r = { NT35510_GAMMA_POS_DEFAULT },
> >          .gamma_corr_pos_g = { NT35510_GAMMA_POS_DEFAULT },
> >          .gamma_corr_pos_b = { NT35510_GAMMA_POS_DEFAULT },
> >          .gamma_corr_neg_r = { NT35510_GAMMA_NEG_DEFAULT },
> >          .gamma_corr_neg_g = { NT35510_GAMMA_NEG_DEFAULT },
> >          .gamma_corr_neg_b = { NT35510_GAMMA_NEG_DEFAULT },
> > 
> > I have added driver support for this based on the code drops from Novatek.
> > 
> > So what we want is being able to actually adjust these curves, like we
> > do for professional monitors.
> > 
> > However without the datasheet how am I supposed to do anything with this?
> > I can't just trial-and-error such stuff. Novatek need to back any attempts
> > and provide feedback to do such stuff.
> 
> We also need to provide APIs for this over multiple DDICs, but what publicly have
> is very limited and most of the commands are not documented and we can't
> compare between multiple vendors and implement some generics helpers.
> 
> > I guess adding gamma correction to the panel frameworks and using
> > the existing infrastructure in DRM for this is our problem, but then we at
> > least need to know what we are doing.
> > 
> >> - Dynamic rate switching
> >> - Command mode self-refresh
> >>
> >> This lack of evolution has led to severe fragmentation between upstream
> >> and vendor downstream trees for advanced devices support, creating a heavy
> >> maintenance burden and making native hardware support incredibly difficult.
> > 
> > How do these vendor trees look?
> 
> I only have experience with Qualcomm and they have an ultra-generic driver
> which can run any panel in the universe (spoiler: no) with some super complex
> DT entries and support all those super complex self-refresh and dynamic
> rate change.
> 
> > I'm curious. What I expect is more blobs of random hex digits without
> > explanation writing magic into the display IC and named do_the_stuff().
> > But maybe there are actually some real first class citizens here with
> > proper structured drivers and a datasheet to back the code up?
> 
> There's some stuff with the DDIC but some are in the DSI spec, but since
> we can't any of them publicly it's hard to implement those stuff without
> a vendor willing to implement all those features in the DSI host driver
> first.

-- 
Regards,

Laurent Pinchart


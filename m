Return-Path: <ksummit+bounces-2915-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rP+OMWh8H2psmQAAu9opvQ
	(envelope-from <ksummit+bounces-2915-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 03 Jun 2026 02:59:20 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9F633444
	for <lists@lfdr.de>; Wed, 03 Jun 2026 02:59:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=NiF2MgpE;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2915-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2915-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5183020037
	for <lists@lfdr.de>; Wed,  3 Jun 2026 00:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0A72749C1;
	Wed,  3 Jun 2026 00:59:16 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567517B505
	for <ksummit@lists.linux.dev>; Wed,  3 Jun 2026 00:59:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448355; cv=none; b=K42Yd4Y2/6z1LwHgJK0dW77A8L9INcmjwe4AddsvxWuyJLzxcImrb5IidaiSb6LjJ7OglFH7D94yj/V1SBhFNo4AS9D03i7ucG5Xq/3tzlVTQAPhbqHLcx0F2zR110MN7Kqwq9KRvjwjnw8JFOAp92/efmlj7/XdaAb4qNYHfpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448355; c=relaxed/simple;
	bh=uoiyqNXK8uxHvEs5ydefIL36ZwPdxLGs9GezVzcAbvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q39o99ys2R5UskWwvY8hOQDuyOyVXzds0+17xVG5XwCwl3cHEiKWJ2QIdkBGDXAGPLuMq8SFc1v/o9HCG4fnrrz2Nx90HKq47cT+NT9HSh9GqpIiutic5D/fJHe4QbhIBnv5XY14Y3iXWbiV5rNP+OQ7OOE4wI9OmC+LxJcdorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NiF2MgpE; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963b8b4382dso2638715241.0
        for <ksummit@lists.linux.dev>; Tue, 02 Jun 2026 17:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780448353; x=1781053153; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoiyqNXK8uxHvEs5ydefIL36ZwPdxLGs9GezVzcAbvE=;
        b=NiF2MgpE+Y1oVCLVkveMT65Zgmr1t+USckIqnl7jUZuLdBUnRsJL+uI5yMrItvFTyt
         0G4pDf/nsSrp3XRx+qQNO4R7XrFPVbob+peR4LCrl9UUNfJF3zNoNhEA5jAsdaao6Aw0
         etjhdSdNx90Gr1kNjeIb9rtFOMw79K11Cn+VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448353; x=1781053153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uoiyqNXK8uxHvEs5ydefIL36ZwPdxLGs9GezVzcAbvE=;
        b=ouMF04KzzgefnQ4NYDhXlCLOgQkON4ZARr+rjjPqhbm4jEAM9FwDF5VRrdDs5fCYwS
         eYVGulRkU1+ElGDQe6go2aXb3dHNxjWWyfSaBRXKEII2CmDHex6ttcCCUkRJiR9zXYOe
         qrT/GXK6f11UaUZs0EMUnyV1PNXOCNn73zGX1nM8Reb2K50Gyqbx+G/ocxzC3kc2/BoU
         jVI1NBPGOzmMa7nKAXR4zqH6bG89eFvXzTOWT6AsOlIYMFqu3UkDR16350JJwqQb36iu
         4kXEKZeyOAHschYUmcKMWm3+JKb8eCH6htC0+IS9LHD3Vnv1KaNCbOCgGIojSEIOENI8
         NRtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B1TjXy/DTZAhKpM0UHIwDKW0vV3s8AcaqLN9AfEXDsRp55j3ib6j8RYsrITliDh3asfQf+dLj@lists.linux.dev
X-Gm-Message-State: AOJu0YwDNibYCgrlCEjJRmA7ObIeSSuMD8jJN1zpiUYO0PksCKmKJR/A
	5pgwi9lEV2iPNb8KsGShAVoh0EO0tNwq6d9Be6soyQrrbZ3pIfsqh/QIU4g7yT5RblNH1byPEf0
	kudA=
X-Gm-Gg: Acq92OHpTmkIk1Sde1isP2KhibNZBp1KBaak/9qE3XmrF9YQr/ngzY85km0OQCcpgz8
	JTqYIDyh5jSljceIfXN7Czeiu+bVeeDEmqsYMkp/qcWTbexoLgCr5AZiq2qtPzYLu/JSDdmO2RU
	2m5YlTww08ILqoaietbAuqv0WtsFw74lCUewTfqPqy+xUMVpc7RBVFcnvW+fffAnAkZUhI1/pr9
	8PyWYho5jGzT8jwq0gkkfiBSc4p1d/Wa6DuadGqYIFzWHk4Y6TGPE3+OD7PBl8H7BUIgBoFLjqA
	AylMrk2wc5wN48jsA3fjl1aeR/c1uWzKkeNuTZXgSjv9emzgpBilFQmRF6YDdc2tVKl/JMFNi13
	O7H5XXbn9zmCqciyJMIA5BPhyXj6eObz2D6OTGBrhf2knSstxOwIKk3xWNgMRkDEEG2jJIDbD1+
	U4vLpH6REF6F4DA49KM0EYoXfbd+ybVuTT2+6ZltixELV+dlUYYA4Y7AUjMnm5Yfx+gVnqy35UN
	+DIaz/aD9k=
X-Received: by 2002:a67:e7c4:0:b0:6cf:882e:c445 with SMTP id ada2fe7eead31-6ec2bfe927bmr514539137.10.1780448353200;
        Tue, 02 Jun 2026 17:59:13 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f9afe7sm651346241.6.2026.06.02.17.59.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 17:59:11 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a997dea4so3829833241.2
        for <ksummit@lists.linux.dev>; Tue, 02 Jun 2026 17:59:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8P0PkFYIVic/xAs7vCnLMgnnoSaBEv1zZfqf5WkDDWjCta0Um36I+m3obr1qQItD9APQ/RY95x@lists.linux.dev
X-Received: by 2002:a05:6102:38c6:b0:632:78bc:2bdf with SMTP id
 ada2fe7eead31-6ec4e759414mr522432137.31.1780448350096; Tue, 02 Jun 2026
 17:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org> <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
In-Reply-To: <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jun 2026 17:58:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VCpr6eUSN7=MF4ud=JxhUPwZJUgEMZJBz0wcF=LQNuvQ@mail.gmail.com>
X-Gm-Features: AVHnY4LeUoQkg9YEH3ljqmKPkhIJVqJAr42r_Q7a1kkkRS50xj2TpC_YvgGO72A
Message-ID: <CAD=FV=VCpr6eUSN7=MF4ud=JxhUPwZJUgEMZJBz0wcF=LQNuvQ@mail.gmail.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern age
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, ksummit@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,ksummit@lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2915-lists=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BA9F633444

Hi,

On Tue, May 26, 2026 at 2:30=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Neil,
>
> I support this topic. I have hesitated to sign up as panel maintainer mai=
nly
> because I have too much other stuff to do.

At the moment, my day job has taken me further away from interacting
with panels, but I'm still interested in the topic for sure. ;-)


> One thing we need to discuss is the hostility or active disinterest of
> panel IC vendors to the Linux community, or maybe to all their customers.
> My general impression is that they rarely publish datasheets, and if so
> under NDA, and their idea of a driver is a bunch of opaque custom
> commands sent during panel start-up and other infliction points.
>
> Has there ever been a single kernel commit directly from a panel IC
> company such as Novatek, Ilitek, Samsung (their panel business unit,
> not Samsung mobile), etc?

I share Linus's sentiments here. I've only interacted with panel
manufacturers by proxy: I've interacted with ODMs who then interacted
with panel vendors. I've always been a bit shocked by the "sequence of
opaque hex commands" and would love to see something better if we can
figure out a way to improve it.


> > This lack of evolution has led to severe fragmentation between upstream
> > and vendor downstream trees for advanced devices support, creating a he=
avy
> > maintenance burden and making native hardware support incredibly diffic=
ult.
>
> How do these vendor trees look?
>
> I'm curious. What I expect is more blobs of random hex digits without
> explanation writing magic into the display IC and named do_the_stuff().
> But maybe there are actually some real first class citizens here with
> proper structured drivers and a datasheet to back the code up?

The only drivers I have experience with (other than ones I've
performed random cleanups on) were ones that were part of Chromebooks,
and there were no downstream trees there. Are there example vendor
drivers you can point to? My first instinct would be for someone to
take one of the vendor drivers with advanced features and start trying
to upstream it. It would be even better to look at two (or three)
different vendor drivers that all tried to add the same type of
feature, but that might be asking too much.

...but if that's a bunch of hex blobs, then maybe that doesn't help us
much. To make progress, we'd need to find someone making a product
that cares enough about upstream drivers that they will put pressure
on a panel vendor. Unfortunately, ChromeOS mostly focused on eDP
panels, with a few cheap MIPI panels here and there. ...and Android's
GKI tends to discourage people from upstreaming driver code...

-Doug


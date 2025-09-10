Return-Path: <ksummit+bounces-2313-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B44B5132C
	for <lists@lfdr.de>; Wed, 10 Sep 2025 11:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 395DD3A83C0
	for <lists@lfdr.de>; Wed, 10 Sep 2025 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BD725DB06;
	Wed, 10 Sep 2025 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajgdVQeg"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389401DFF7
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497810; cv=none; b=LOI1yqM8TfTI8Iwzd6Z2Y7Jai8PrskjpAnQFuuveVz/QLqQ34XMYmnJRlUgJ87FLn1O/3m+p8uUnBWiGtz/oxeV/c1KXKRrGF9xH0cbrE9B0JwM3RxXTVZQVkgnRWn22mFCjLasnphF9DagFx2QGdQXzRgH2CGXHw7FOl8SI8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497810; c=relaxed/simple;
	bh=Arofhyx1TEu7R6Dw3jah6c4cRa9rC5Al23ys0fj9/3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AD2s1F0g3Fgt/GYiX6WbRTyl4O1vLQtilgOHtAkzvQ1fZhSIvDL1G69gyxvuO38dYlcL7D66jhQjNm+lOHSC3Z+dNP+fwlwEyAK5w4FQrxy8+qk8in6O6wahJhMUvkCRoF8GA+lFvvsEBk+xiR0D94p0vBgxO7zGEic/wdOTDYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajgdVQeg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f76454f69so6344401e87.0
        for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497807; x=1758102607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=ajgdVQegeyADjnkrac49P3r1Q6qDpzVTr6ebe89VBcAxosHMAG8q+eeC36Lneige88
         lLFLNFOxPyhM3wmCVhy56/RF981lYKX7c3m4ZJw9YcfXBQvzN8sRsS3ChwW6c4lB8ZBk
         5BHV/6awOcwWK/MXsiB7sQ9BESRj3yVN6z8Bc3wwnaW0YfdodO0SLf8xtGQvIRqzAb0r
         dwqqMnauRzGs+2rojZ6nSSamL5T+bBdQQjvd+XLF7mzuLTElIWQaflPPZS5/6HL53KlV
         Vn1G0UpvTUfwzT/rmbahxSSqavpgIo5YXjDAWgnaroQm34JkDKqFEShd9UHjsIdV5dJM
         WAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497807; x=1758102607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=ihkxHXoH5MFdzyELjGmBbOMLcNA48Ln9XD/ObFyfqiEP1HUjigXs30Sx9pa5UrfLOm
         z62WHZMrpHrDaXC8T6CswNzf0y22OaAKPLvsGXXUD12fXL+9yacnOZL++Rzy5x56y9ge
         LtNKn37lPwrV8G0vTSGmvW9X5Gmrdn8QBfJYnOZgPny4y52cNgLfskeh344IVHTVzkYT
         0MN4WTUqK4JNO8NU/4AHF4RfC1Q6pXkCZtD0ei4Nld6lzs2HNQiqR6TTDEeMMhvqgiSO
         YrhofMqFgsayEqoXWWdo8JmKVorw8AH+qkQ5IJ6caRLP9ii7O0GJe3kDAb7XpeA3NcZJ
         BOrA==
X-Forwarded-Encrypted: i=1; AJvYcCVKECctc31t/hw25OKxMhttbv6hA82ns3HaqPNELD7N3s8xYYGdlBav2zgZ7p1aYWEdkPaDwbsP@lists.linux.dev
X-Gm-Message-State: AOJu0YyW2byBhDzCG9kQi/KWBcDE/IqVEIBBausUdB1MyOnDNWYqs5Aa
	d719gAAu0ejzlyfymJqAk2IBW2DgNh18LU0MessnN1mnXFFeHeAL93R7LDO09MutSlYtRYNxHHW
	jLpjd/cafq5P/0Hq7CzLrVfVrX8nqvfjnn5jIZVvDfA==
X-Gm-Gg: ASbGncu5qEQQ5qFr33WqrrTqdNEyb12Za3qYFuNlYMVc887b1i+KHrhJ5CaLlkHXFEl
	o20oz77TDvZxYVrHUgGdj4YHH3OaNi/11kZEtUPZkYr8ze6XmBn0FQqPtoI88YDmD+mtjPdMnWY
	T7bgWlKSp2vRQoiDi3Zx5LuNQ/i3fSC6BzGtCnngYlwNimYt00BaXGq2LiAU3BC9uDzviuNDw7X
	MK0dp0=
X-Google-Smtp-Source: AGHT+IGq2x91wz7j8DANH/yJwpeO4d/hIy0ABq1WES66C1SeY2aK74/VWAJ5lsiz89NvTXBUTDFt595MC0reZwFBRxA=
X-Received: by 2002:a2e:a009:0:20b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-33b536f14b1mr41029971fa.31.1757497807337; Wed, 10 Sep 2025
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <aMDYdp3H-yOHU1Pm@casper.infradead.org>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:49:55 +0200
X-Gm-Features: Ac12FXxu2Penmvb-ANhZIzZlxEacPcTMGZ42OzvKFfqr5PHU2ajbCjOLxBc-XSU
Message-ID: <CACRpkdZZZNV5BdNhyXEK__=EJLjDtAEsc2Kv4Tv53+=Mv-8R=w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Matthew Wilcox <willy@infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:46=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:

> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.

I sent an RFC patch so we can see what Russell has to say about this,
it is currently only enabled by default on the VT8500 machine.

Yours,
Linus Walleij


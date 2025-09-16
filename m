Return-Path: <ksummit+bounces-2391-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C043CB58EB3
	for <lists@lfdr.de>; Tue, 16 Sep 2025 08:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2761816FE84
	for <lists@lfdr.de>; Tue, 16 Sep 2025 06:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F622DF706;
	Tue, 16 Sep 2025 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/bsLuF1"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F5F2DECBF
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005803; cv=none; b=Y5DGXeRCc83cZViaf1OvifUrvq1JCaY1a4IgwdrTvYd32r5d7Da6rZEI68MGbw32Znc/caFfn1j+NpHWiL+gxEMfNfHh27Y/MsCdEvUtslZnNPvmaXzdbyMcxBcgUAKleie7+hmk5EgbDOKZewkoPwW+skXM/WIqLsFHQ7Xl/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005803; c=relaxed/simple;
	bh=PHK0ukpPRHjR14iuyE6T46MyBkEfhV1SOVZ+eL88m2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuzIp2Um1EefEu9OvlbSbs+HtOBBrd0HqAOiWT/QgUgBeDRm9Wn+jL3XWUcYkAujCqMPZ0v0N085xP6+iVdynIC/ZXPpiZy2Ac3JF8ErU39iZ+H540SIXkV4SbWOxqXEvtyYcBI9yCkO212fRKQ8bRndph06Gw7Qpkh16NOTbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/bsLuF1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336c2194a65so40831161fa.2
        for <ksummit@lists.linux.dev>; Mon, 15 Sep 2025 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758005800; x=1758610600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6pSFoqhUUMdde5fnkehdhbRN3QpNcEADzGuijbdeyk=;
        b=O/bsLuF1I6E7t4TV8TKu2zwoElpHJ/qgh7s0pMalYneVzV8pSQ8HKN9sYGf36mfPio
         h9v88b4EZMZMeEVnsF9qiU8wDukE1s0hD93pEeM19t8WLBsBG2pWY9I1rrLrSJB3aBlO
         v7WJ+Jn2RVYKtAYi6jGVmJl4yeEL6qDFvGnzsKg9G0mUtFflA4nM4La5nZEVvCz7PU5/
         zIt9rpMgLvili3qQtGxjNeU7eZjtARrqBu7R65HnLuQrleE32dh0fKB8kGV5lJGm2N1c
         0QRWf+BWMsT81B9e/e57RTH1WgNLxgtxkBHv7/DS/e20wj4LIte4pX1ucbaLZD3ajK1n
         sOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758005800; x=1758610600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6pSFoqhUUMdde5fnkehdhbRN3QpNcEADzGuijbdeyk=;
        b=c1M86Ij0F0kybcEgvK319z/nWEJKXJqh9iDjo248BhtkBIzZuTqLu3YxpptJm2LqMG
         FTHrbhLUByOxKeYp2mjlbxSpdk7LK8qCuk2x7TDbrH6LmFlgQJZ7J6b8iDL8T9vku1vU
         m/PFxfn9pmzYelCr+lGVP8ncMoaZak14rcg2DPb4g5JFHRsds4o7svmVNv/cd/2F53fl
         obtScBdOtEu6y5+gok3/CH1PcRnIRUki9aIaRnLUqNYvtjAtKbvlQVGwBdUdGhpj9R0U
         4CArAsYonRowKutQ4RGcp6crTXPSyv7ShrebAfATRnFAkcthxyxWmOy1UWMFmegxqBKM
         ePFw==
X-Gm-Message-State: AOJu0YzAAHWTdwVEHClLiBfXDhcXRvNPkKgIMirfVrCtYbT0ABKZy51K
	DBO2X1Ra6WSbNBlDjNaBnfooTN0F6MmtZM0Bx5z0pesenBGVtpU3eLT250qCyJA4JPwfRayqOQi
	hqt3MHuRqV37w7WGGbUa1m+5hBVsddouLNnm/DytpmA==
X-Gm-Gg: ASbGncskZdYr5bKqmACYjRXaRSjJD3AkH3r19APgBVX7cT1CF8XvAmhm9S1n2fYca13
	5VFwHOepfbjt61lPaD965COJvKCdJBoH9OOBpBmmFwz+4X7NoydbYJmPdPmnBf89s+XDkK5FoVx
	j28B0lBhPO7yfPSjF/AUSOQWObVtbSPNyTqwjhuZEZPotqvh5UZte2s92bpsQ3swby3yGjjxwdV
	ZevvSI=
X-Google-Smtp-Source: AGHT+IHKk77tkHdNK3J0XX8xz2Zslqhr4nLlFDGF+p71HlqDIX3VcpDDtv6KJTiBUirCD1P8Pa5DwFjLr+2tZtWGY5Y=
X-Received: by 2002:a05:651c:20cd:20b0:336:9e1b:b640 with SMTP id
 38308e7fff4ca-3513e6010fdmr32305981fa.24.1758005799824; Mon, 15 Sep 2025
 23:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aMWEhqia_jpl12uI@tzungbi-laptop>
In-Reply-To: <aMWEhqia_jpl12uI@tzungbi-laptop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Sep 2025 08:56:28 +0200
X-Gm-Features: AS18NWAbeqd8s2rTedH7PdGcpZPd6XCJ8jYT5bAXXl5adr1jE6Kyv8lOhNqB_3A
Message-ID: <CACRpkdb-m0mRJNvh+54jQrcQr2b7zLdrk9k2kpAiJPpRr-yYcA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Revocable: a mechanism for preventing "classic"
 use-after-free bugs
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: ksummit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 4:49=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:

> We will present "revocable"[2], a new kernel mechanism for resource
> management.  A revocable allows a resource provider (e.g., a device drive=
r)
> to invalidate access to a resource from a consumer (e.g., a character dev=
ice)
> when the underlying device is no longer available.  Once a resource is
> revoked, any further attempts to use it will fail gracefully, thus preven=
ting
> the UAF.

I looked at it and it looks very interesting.

We have faced this problem in the GPIO subsystem because a lot
of GPIO expanders are on pluggable buses such as USB, while
there may still be consumers not only in kernelspace but also
in userspace.

We remove the underlying device driver and irqchip etc in
gpiochip_remove() with:

        /* Numb the device, cancelling all outstanding operations */
        rcu_assign_pointer(gdev->chip, NULL);

but any userspace consumers are
"dangling", which in practice means that e.g.
linehandle_ioctl() gets called and then:

        if (!rcu_access_pointer(lh->gdev->chip))
                return -ENODEV;

This seems to be using a similar idea or the same idea and using
RCU as well because you have:

void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu=
)
{
    struct revocable_provider *rp =3D rev->rp;

    rev->idx =3D srcu_read_lock(&rp->srcu);
    return rcu_dereference(rp->res);
}

AFAICT this is pretty much the same, but more bells and whistles and
more elegantly designed as a slot-in solution :)

So we would probably be able to move over to this API very easily.

Yours,
Linus Walleij


Return-Path: <ksummit+bounces-2361-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB714B53B13
	for <lists@lfdr.de>; Thu, 11 Sep 2025 20:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034B8188BE64
	for <lists@lfdr.de>; Thu, 11 Sep 2025 18:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F19936298F;
	Thu, 11 Sep 2025 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEGPUW0x"
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12BA35FC1A
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614225; cv=none; b=MIR3KlFo9X5isal/S1IJ5/liFtZ17H41VD218rzGCCJgbHHsIO+BS9RvuoKHiMwgCKkqfzn2xIOnpx0OxhI40KzXMUtJH+ZMtAU8tKxeiHNtiMMOozq7XOxyYD2MmG2WammA7wYfVxCDF8pBHe59G9gxgqzyEl1qfvwOlQqce9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614225; c=relaxed/simple;
	bh=l9/p5sdJG4pzj3lnPo1KAtkw76GLU6pHyVYbHpNBte0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJSz00h+BgUMhwo9VbqbCdnget15pPGnpyoHH8SCAk8aeeCxGioQXSTFZQxwNXmbPsyHTYEjcem08+TjDy488gpNgx9S6gStNNapNc5i1PO/ncgc9DmWwvoN6MNlDu9qFw+zdvt33+3nvzO0SEDQvYSki3H3KWxzdB20yq57ktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEGPUW0x; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-60170e15cf6so731970d50.0
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614222; x=1758219022; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l9/p5sdJG4pzj3lnPo1KAtkw76GLU6pHyVYbHpNBte0=;
        b=YEGPUW0xEP/igiLAjA5WjjTiG51/I5o3+W7bPF5J+FNJqra2N/FQH+32H1FgQaG+rn
         87E/c3RqK8V7qqZBkEX857fwxa9SxBnYgPsEe9pArFcUgyWQ1HCol4vzgWinEOnzgaqG
         EVXT2YNq/onPt5ekjIjexAt2OVH+TEhtNrQHnV5agqgMDij1SCtj70INf8HXovCpF/+m
         bKZrcLXXkZECCgIkVZCy/tc6Nf9rYgRdxKT5Ak7Uh3wm8LNiR2uGUdduh/BER+Uy+u1A
         sV9B03rurNaIPbkvMaqEPhFEy+5vqrhSFqSq4c+yDBBJWwDo80H8R+Q54kdvQvotxfKp
         jwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614222; x=1758219022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9/p5sdJG4pzj3lnPo1KAtkw76GLU6pHyVYbHpNBte0=;
        b=WRXTahfiY4Dhofo8M467Zqjqvvrdrrk+l80QKb1rwtvuCwDrKpF1AJ/zMbTYAVblG3
         CaLOle6ofXsV2AzdREnz3yUbGQNEebkGsZTnqHKBWw88gNC2sKtPaaUsCttMyOgMMGYk
         KvixTVd+tuOU2k5u5uPfq8rah4kmCgR/MqgIBvEkxKxMKPt2ctVdND7zbilSMrbZ8ECd
         720jueE52Sl1k0hAvmTRgZikPQffSfLc4fOBhIay4z0NY7hMUi6A4pBrLryqJ7ijqMpO
         JXp66JsLOquMyPCrDpnLJvTZBEoQcTRnv7Duwrzz1f07OLh2z1siwP4xgQgzpxAmO8Qj
         Db4A==
X-Gm-Message-State: AOJu0YxVonRY4McHrS+XFco6LIZIxw+fe8lMuY4uRQ5Tx7g2GHb3yLQM
	o9vefp28zfxOVE+BBPOaUTh+Sl6AYHRvh4FV5ZBFQFhYn+FiP32N8cYKeXLg4pNQd+u5Zmn102U
	UFBWPRteGWw9N73WZRsBrG1tP4z+UhvQ=
X-Gm-Gg: ASbGncu9gqkaoJOxK+4VLv58rJ4Dr+Tf/tSl1/GA6UpfB+1IBOci79nz6S0PqmWzduk
	ioIp9eeHSmqyO4tlc5r8hKgcrArIdIrohMMqKP2gja7D+0tNgw1UNt5irTwCpy/mLZ+v1MJIGfi
	S2mWz+2pohK/D61ojyEntrEz+hHBURSZWgLLPO7m/f1z6mykehibeu4E6C/bxvbyGvgjs5qqQYm
	IFbtTmyg+qVUqO0PZbj
X-Google-Smtp-Source: AGHT+IFOvWtnSqZvYQVpmDLgI7WItEZGR/SkBC6n4tP1XadDJbtCEDM1u6MKkoHV6MfxpV8v+2V09wCM5Mt7t8e5d+A=
X-Received: by 2002:a53:ec4e:0:b0:612:558d:da22 with SMTP id
 956f58d0204a3-627237d4891mr333906d50.25.1757614222592; Thu, 11 Sep 2025
 11:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACRpkdaKKeD3zNXM3nazfVb2m9uwfywE_rnGy3hMxwX-Aw6stQ@mail.gmail.com>
 <a74382d8-a2bf-4534-b0ee-a97d8faabf16@intel.com>
In-Reply-To: <a74382d8-a2bf-4534-b0ee-a97d8faabf16@intel.com>
From: Konstantin Sinyuk <sinyuk@gmail.com>
Date: Thu, 11 Sep 2025 21:10:11 +0300
X-Gm-Features: AS18NWDKmET6LCunuEN-Xa77ktydJ2qk662CxusBHesN3fsy3iIJoPEneItj9a8
Message-ID: <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: ksummit@lists.linux.dev, Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 11, 2025 at 10:42:01AM +0200, Linus Walleij wrote:
> So this gives at hand that since this is no "ordinary" memory-mapped
> driver, it needs its own bus and therefore intuitively its own subsystem?
>
> What about drivers/accel/ual where other accelerators live?
>
> Or if that is somehow inappropriate, just drivers/ual, don't be shy.

Hi Linus,

For the initial RFC, I thought to start under drivers/misc/ just as a
lightweight entry point to get early review. But I agree with you that
UALink fits more naturally as its own subsystem, similar to how CXL is
handled, rather than being grouped under accel. The long-term plan
should definitely be drivers/ual/.

Best Regards,
 Konstantin


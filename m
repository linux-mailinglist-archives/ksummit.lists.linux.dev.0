Return-Path: <ksummit+bounces-2366-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B0B543C0
	for <lists@lfdr.de>; Fri, 12 Sep 2025 09:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22822169366
	for <lists@lfdr.de>; Fri, 12 Sep 2025 07:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757312C0262;
	Fri, 12 Sep 2025 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npNBcVD9"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FD2BF016
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757661765; cv=none; b=T0DcreZ11Ns91/SV46djqyRoen9tCW12x1SCIZfiGm4Rax3eeNwSPXCHIeoVEry31SFf0x5QtyQFCO4Dlf0ISym+gOKYZachiUr6L0TeDBoMcmOkPsZmaUIJ1kH8sEB2ltLDTrNUOjAlJYB+aZuACJlVfX7RRbHK0UycjcJeSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757661765; c=relaxed/simple;
	bh=LFFDItX69IfeFYupqtxi699PEVLId8z2psSqs6Xp7Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K34p/DyZJ9nrx5PaL7gECR4P/7MAhduD/oH/qrNZihStwX+CFa4cheAiWc+EcZd8yRd5qjFKsl+PCJqY/H4TUPqmtzhKcDERLlyI8WmpxswuSM6j9WADrfiwO9jePyPLHzuNnz0N02E667trtlSG0PpVQZmDR91s5lNNzWKYRIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npNBcVD9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso15279801fa.3
        for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757661761; x=1758266561; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFFDItX69IfeFYupqtxi699PEVLId8z2psSqs6Xp7Bo=;
        b=npNBcVD9yxTOQ4udDSJp9rCkqigg8YqmOvxbI2c2XlqGuyx06/aLSAsKoWjVwjMrhw
         ng4GNdD2L1k6bqYymhcutV69MckfNDzxvhrMl+ONCUq88FOeBw4L9aw7KrWt7nEoK9qV
         +VmvWI0OzCDTO/qami9/SZOGag6yU4e0Kgt7DeNDsocFsPqfuxu4T7e00J0231b8lIcn
         HA9OLuQ6p6e3mdgfMWnru6EkwvaPwZN6wbEMi4OOI66+uD5M7c+4PiBRqePyyhp2hfv1
         mRirAcx98qJbO3sdtdd5PCk2aOLcQL60qKuE/kdwkTOFYbQBnyOBpB+kQS2ReE5U6LLK
         Mlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757661761; x=1758266561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFFDItX69IfeFYupqtxi699PEVLId8z2psSqs6Xp7Bo=;
        b=q2eE+yrZxZ80wQmO0H/SOwqG0MquL6mIeM/Bf5BiexmlLXQppEJ15wxlbKA6k8KG9P
         im0pIrBKtc8yMfOzd0bTmaNKU9nGygNUcc8W/8UuPPlMb6jPxea/nEjx1IniZI4SzLHG
         oDm+Pg+s/MAXYqJOJb1eCU9QnptoumXcc8TpMR5EtpWoTrhLtOPpCAmAc9er6JxM6Dd8
         g9CVo64dO4nKcYRboAxvp/7T9+ACsOzVZjFcpcSYlGe4tsDbjmygyXvPZu/7xDw/n1cJ
         RnoR+I+7FQurBLuEwP4Q8nvn5LwmidcVnyUjXc+BCkLJkW+dseypUi6Havc5X0z245X8
         OZ6Q==
X-Gm-Message-State: AOJu0YxrnOQoOjyKT73xcv4Mf5QIBvZvsfAaZro3+yrSpuGHEkllH1Ti
	XMP7VG4Ufk1KdkMzt4ORB0ncB28HEH/Y6pA2p2cT02dgtbpZRJmStYS8CK3hUfY+1xogtTgZuBY
	ubaZg8zR52kNfzUPtH8eFFeLtsKQX3q2/ME315Un0IQ==
X-Gm-Gg: ASbGncunwviA9L/ZxTH9ah8C+DsH49KpuQGBE2sBhc+18N2lwy112S7aRecQAWdNFpT
	oR0MhK65wilUArh6Kxw92h8xSBrE5JxWN1NecLYHb2oThqlOZ4qJu82/UUYyDmPoR9TEdBYC+iU
	Z7P4i4OQjBXpiM35HX9GyHQzG4TebM9x+3ricNZSkMoNs1DMWygsky//gn7rpcw93Q/o7gKXaQM
	rgPi3M=
X-Google-Smtp-Source: AGHT+IEpb1Ksju8gX+f7hKclHLv2efeL5F+hA9m3pMOp6ExWKNkaF7ctx9xFmDCAFKq8FR+VV195BmgI4LkeHUUPEvg=
X-Received: by 2002:a2e:a988:0:b0:352:46d5:e541 with SMTP id
 38308e7fff4ca-35246d5e92amr1938961fa.0.1757661761059; Fri, 12 Sep 2025
 00:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACRpkdaKKeD3zNXM3nazfVb2m9uwfywE_rnGy3hMxwX-Aw6stQ@mail.gmail.com>
 <a74382d8-a2bf-4534-b0ee-a97d8faabf16@intel.com> <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
In-Reply-To: <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:22:29 +0200
X-Gm-Features: Ac12FXy_V9Gfmv07XXCdNCSIHJU004gWL0IBTxoXeC4GDkF8qSxbjdkdNUb-s00
Message-ID: <CACRpkda5KwVP-J=_3goL6WAy=dR1ZQufdjT6pJyY+Fno_Hsy6w@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: Konstantin Sinyuk <sinyuk@gmail.com>
Cc: ksummit@lists.linux.dev, Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 8:10=E2=80=AFPM Konstantin Sinyuk <sinyuk@gmail.com=
> wrote:
> On Thu, Sep 11, 2025 at 10:42:01AM +0200, Linus Walleij wrote:

> > So this gives at hand that since this is no "ordinary" memory-mapped
> > driver, it needs its own bus and therefore intuitively its own subsyste=
m?
> >
> > What about drivers/accel/ual where other accelerators live?
> >
> > Or if that is somehow inappropriate, just drivers/ual, don't be shy.
>
> Hi Linus,
>
> For the initial RFC, I thought to start under drivers/misc/ just as a
> lightweight entry point to get early review. But I agree with you that
> UALink fits more naturally as its own subsystem, similar to how CXL is
> handled, rather than being grouped under accel. The long-term plan
> should definitely be drivers/ual/.

If you want to "ease in" drivers the appropriate place is drivers/staging.

But if you have a focused team and you are going to start small
and work on this then just use drivers/accel/ual from day 1.

Yours,
Linus Walleij


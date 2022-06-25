Return-Path: <ksummit+bounces-719-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41355ACEB
	for <lists@lfdr.de>; Sun, 26 Jun 2022 00:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id C9F472E0C95
	for <lists@lfdr.de>; Sat, 25 Jun 2022 22:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CE54C70;
	Sat, 25 Jun 2022 22:29:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1E67C
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 22:29:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id p136so4319716ybg.4
        for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTQHlaasZWX4wcAvTFbOB4ZZx5EcyEnL3WHt4znf1Gk=;
        b=wuXvYKmkimtuHWovAU+Cr/PvuLZtBMmwlszf31MAJN8DdfiboWS1r7wrUzpV5CCanF
         5MCO0z1Un0p8ZVJuhka4+3iH5SghDXNhliIaL15Q9zCPrPbTLXsjg+apGAUWHL+cldfH
         Wi2wCuROQqvr/SJ7FJaPh5BkS3uIQFv91hlgTyXpryVOF9WXS5OQlEQJBDy1MCn3DZLX
         xH9SZU5ZZY3POEGAa8CfgwbnwCrhOFwrwFyxrDBcU4Yd7hbP/PnV6P1wKducYp9maRNH
         hpOF/5NqRMVruMogNozx05rU4+6SrIlteMiSMx4d37/R0xba0TNuMsWHuf3yXPOUs6U4
         6Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTQHlaasZWX4wcAvTFbOB4ZZx5EcyEnL3WHt4znf1Gk=;
        b=TdmQakqxPELhETDLRRi1YcJrCPsHlUr8RC8K0F2xPESfNPQyXgkwCFqvv5sNiHlSL6
         io9ghPnCBkZexZVrLVXapcvlna8ojMm1UHP9sIzepF4bHszRpw6BbfwYlF2fLbxKiZ1X
         AfuWWZSfov5r5Q5pKSJmD5MOWN+pPCdvyKIzYJhepNCxHAkxiy3xD15qGSBwuaQYs6zM
         RudvWa1cJZ8mlheMcVaD6FdsmSr2cQgkv0V2NmH1fycluZPsJqpiVATQ/fHoA7vXd5SW
         NQfhHFeTnOJijXZsf+GPe7gO/6HQOp11D0Mduc2ePNmcIwrmaNpgZchdgbrX0gsQk0ix
         s46w==
X-Gm-Message-State: AJIora+kEQvcSfjP9dSGSwTo33nMleq4WQKr0MUOmMboCy89n8CSporz
	wi3DUeNhfPNNEzqVlP3IpE1QcA5qvx6dRrzYq2xIdQ==
X-Google-Smtp-Source: AGRyM1tx7fEb/LS+BlubWxDbA0kZl+pIZV3YbMhfV0Nht7ZD8U+tV/Dk4St6jW9SuFnCzz5h6/GBiE8+QPEzPFykar0=
X-Received: by 2002:a25:d088:0:b0:669:b825:8b5 with SMTP id
 h130-20020a25d088000000b00669b82508b5mr6324469ybg.533.1656196179368; Sat, 25
 Jun 2022 15:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com> <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com> <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk> <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com> <20220625124522.507a5b06@sal.lan>
In-Reply-To: <20220625124522.507a5b06@sal.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 00:29:27 +0200
Message-ID: <CACRpkdY1UUqvhKj+a9hOkQo1XG27TvLqweB-EgMdrFuzP38Afw@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, ksummit <ksummit-discuss@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 1:45 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:

> - core parts: mm, vfs, devm_*, wait queues, threads, irq handling, driver
>   core, ...;
> - bus subsystems: PCI, USB, I2C, ...;
> - other core driver-related subsystems like: power management, clocks,...
> - finally, subsystem-specific core functions.
>
> Which probably means that they would need to suffer some rewrite due to
> rust safe mode restrictions, before finally receive Rust (safe) bindings.

I think it is important to keep in mind that Rust may save us
from a few crashes when used in drivers, but that can't be the
main target for Rust.

Rust needs to be put facing the enemy, i.e. people who exploit the
kernel to run arbitrary code and gain local root.

This does not happen in drivers, it happens in abstract code, such
as protocols and the userspace/kernelspace boundary.

OK the USB protocol may be close to the driver but
I'm thinking the network stack and I think during initial review I
suggested things like ksmbd as Windows SMB is known to have been
exploited by intelligence agencies we know things like that is facing
the enemy. I don't know what the ksmbd people feel about that, or
nfsd for that matter, but this kind of code is what matters most
for Rust deployment to pay off.

Yours,
Linus Walleij


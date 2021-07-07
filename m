Return-Path: <ksummit+bounces-290-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D774F3BE907
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 21D603E0FA4
	for <lists@lfdr.de>; Wed,  7 Jul 2021 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920F62F80;
	Wed,  7 Jul 2021 13:50:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DF70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 13:50:36 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e13so2801873ilc.1
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x2sL8da/BtKE2FZBYc5Fkn9fxbuXOEuhoe5MCluAc7s=;
        b=NmoWS5H0r0X95s9XnCiIXX9OLn3ctSlOzoyhvaz+eUUkeByHRfrMz5Z6/t2QzU51ht
         HNuI/dI19qdCUf8qblxiQwaodX4asCWS8NFuwO9HpHyZavuV40NfQlDAIKYapD0YTlz0
         q9+BdFEIngnrh6k7t3nFNjiwJYc3nIZRqsek6tx/PAskDLfxfcxa7zXf68QsOYEkiQ/J
         mTSlAAUDpSo+pJ6XTczHXkqexLp8iAQNmP/u5OZau7r4Liqyd7G3Ol9u8n1rws+pCywN
         p2VzSbUShY1EfPC/JFI8APSA8RQ8WO/awfDK9rZ85X3VgZbLhHAECAkKgNp2VXyHxGsf
         pwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2sL8da/BtKE2FZBYc5Fkn9fxbuXOEuhoe5MCluAc7s=;
        b=TUQYcZ2rEu7q1qUqxt3I8vrCX28meeoKuGHnpYHuahZd1bJm8BKdggU9mSf44ZSXtS
         V9VNq6YcyuGF+aKifeGzdU3l92LhVefWLpOsx/InxgNAvT0c9J/p6gcZywKUaXnVI0og
         tUcaFjQoJui1MQ7hdNUWWbipFFi23Lrk2rP06hGt/qubZrkEYfI0ltPKjtWtXQzbLwRw
         2CJebNRUZW1V6SYTLx1bKE5Pma0Lq+XxiOPvbm8zQgo2ticQQZG7UXXVGDJEoCpEx2RD
         MWfYw7HOp54+FkUEUhHARd/h+7J45pzavIUFhsH4XFipgzdbMnO4RiQAXIjdIiUTozZV
         BLlw==
X-Gm-Message-State: AOAM533ZGBSXdOzhbgXsZgoyNk3G5IuO2sDa1HWkb2hMo909vUw3DC5R
	CVa3GCSspXWv5PPClA08N0B6ov2aGtjKdvt2C0Q=
X-Google-Smtp-Source: ABdhPJzOed0gF6+ofDsSqWF1XgZUP7WjzCebKCecGIp0+bc/+CThku1P5xp+nltBcq5xcxHpp6jVOkxVvnbKWDXAp6w=
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr19152256ilu.94.1625665835858;
 Wed, 07 Jul 2021 06:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal> <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap> <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOSmkgFpSUWtf2ue@sashalap> <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>
 <YOWudA2OAuifxxzH@piout.net>
In-Reply-To: <YOWudA2OAuifxxzH@piout.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jul 2021 15:50:24 +0200
Message-ID: <CANiq72nUCk6ncAESHCb+os3enHORWi2b=gbY-J1HT6JzJBGyNQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sasha Levin <sashal@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 3:39 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> So that means that if a subsystem maintainer doesn't know Rust, Rust
> code should not be merge in that subsystem at all.

I think that could be a sensible approach in the beginning, until more
people get a handle on Rust. But I defer to Greg/Linus et. al. on
particular policies.

Cheers,
Miguel


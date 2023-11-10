Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED57E7E19
	for <lists@lfdr.de>; Fri, 10 Nov 2023 18:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C761C20A81
	for <lists@lfdr.de>; Fri, 10 Nov 2023 17:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A830520B37;
	Fri, 10 Nov 2023 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow1qOKdY"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E9208A8
	for <ksummit@lists.linux.dev>; Fri, 10 Nov 2023 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5056059e0so31331651fa.3
        for <ksummit@lists.linux.dev>; Fri, 10 Nov 2023 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699637072; x=1700241872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbGH6E+IsefyeSLoyY+DZuNgDliJ6DgU1a2NJpKsFcg=;
        b=Ow1qOKdYn9CLPka23GRH8dAxnFxBKdOTTUhwRVoe/D4JF4mMo2TMRimXwJrKmi0LYG
         Km5r4XIGPiqhV4n9YbFPKVTGksL4xYTiorGO1kBKwPydL6jWUkCIr82/aHA6M1PUstqv
         hyiw9hjEoNGh1D3h0DdvLHBNlBsCDXh/F72UaTvZrceophgaUaC10gdf/+oeBS48itQA
         NCHCy/3XpyIUK9FdWpDnrsY5/BhJOMGSeTRVNDFTxsZenvn+UbOj7AnBYY1PZk6MfZsd
         k2q5y8PS2muaek0CCiOibjZxTTY4SZeubrLsqt2toXn+qVH4zjfrclesVfck3ZcHr4K9
         9ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699637072; x=1700241872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbGH6E+IsefyeSLoyY+DZuNgDliJ6DgU1a2NJpKsFcg=;
        b=PBKAK/h2chjfoho0VViNmJ1PtTMTKg/+4qj16ia0VgGRmyhPMA/NHGKhJf1wfq4c5e
         2mZfrVqLXFSP3yO1Zctp4Lid6neXWvxtZc/q8iik65DanHOTVvJOu/CQD4t5YyGiIaDB
         gAuKprBACSb5r6xsUwPrAV3InAQY8xO8fth6bCei+dHtu4kA+1Oa0uhufDjl/1o7HGAe
         pJQzE+S+4k6LG/+GRvFER1xk06rA+1A3IpPwPqDM2H3sL9vannxmB6OwOGH4rOKZ00Bw
         eY7Hih3tQZSoMox+xva1s5E+qwdYQhDUgaVg+TacHLkP3b16wX3eM6V5G72mm3pppwee
         Wetw==
X-Gm-Message-State: AOJu0YxV+48xVERl4XqRJEJaSHO5RzzLgwAx7g6NA02LM8/hTwyMQtD6
	MGqeB9Im6PAzkSR57NGV6clKOEZWwQxVQ3Zr0A==
X-Google-Smtp-Source: AGHT+IGibGOJwJ3ZwHLdzzY8Qmiy9Lepk5hjlSaJireAaa0CNo3GvEjXImzBOMXXm60CTS24ANlOunKCXQhQB21pOx0=
X-Received: by 2002:a05:6512:3e0f:b0:507:9996:f62b with SMTP id
 i15-20020a0565123e0f00b005079996f62bmr4112275lfv.56.1699637071776; Fri, 10
 Nov 2023 09:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk> <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home> <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com> <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
 <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
 <20231109-soft-anaconda-of-passion-5157c7@nitro> <20231109231633.GI4634@ziepe.ca>
 <CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com> <20231110090446.479f4cf5@kernel.org>
In-Reply-To: <20231110090446.479f4cf5@kernel.org>
From: Rob Herring <robherring2@gmail.com>
Date: Fri, 10 Nov 2023 11:24:19 -0600
Message-ID: <CAL_JsqLjO-vLAX7xCe641=2-ii_RRy4S7277t95GAjGGEmHiPQ@mail.gmail.com>
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from linux-kernel@vger.kernel.org
To: Jakub Kicinski <kuba@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Joe Perches <joe@perches.com>, Alex Elder <elder@ieee.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:04=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 9 Nov 2023 16:56:33 -0800 Linus Torvalds wrote:
> > Developers might even be able to sign up to "virtual" lists, where
> > they get cc'd if a patch makes it to that list that has a file pattern
> > that matches their "I'm interested in these path patterns".
>
> Yes. Please.
>
> Could we possibly make that work via IMAP, inject the emails into
> people's inboxes instead of via STMP? It may break local filtering
> and would require that people give k.org passwords / API keys.
> But we won't be running into the STMP rate limits any more.

I think that's already possible in lei. So it comes down to who runs
the IMAP server and where. If localhost works for you, then it should
just be a matter of configuring lei. Though I've not tried any of this
part of lei myself.

And I think there's folks that just want mail delivered to their inbox
with SMTP regardless of what lore/b4/lei can do.

Rob


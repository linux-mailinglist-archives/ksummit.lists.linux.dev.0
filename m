Return-Path: <ksummit+bounces-2173-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524AB2F5AF
	for <lists@lfdr.de>; Thu, 21 Aug 2025 12:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92D21C8582A
	for <lists@lfdr.de>; Thu, 21 Aug 2025 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5220F308F11;
	Thu, 21 Aug 2025 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUIc1WAs"
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D7136358
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773696; cv=none; b=RsTRG3jnEIS3/4h8MNBlfjmyzWV4jBdMKiaFQ1aqziZInG9gA2EGvHvYqtsxfB390yuqpLz43T3ukYJvfxeN8aOLK1cXHnn0SfMJTREhO2/nUrkQMre++qH4RO6cgLX2kNZeEtbdgyyzg2aBo6Tx/YlLsBsHwCdgZExCJ0JM1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773696; c=relaxed/simple;
	bh=6z9+vcQJUI6gFcHn8TkrD2LAj/6hHrhU8RpC0IcDO5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jyc+w6sOxvvGZ+ojQlqrU3Iwoip3e+4oD5gNhc8JXaMBKpGWxrQenfHMfOGs08+wtXs0qBoim+8S6qIRBQp25g7+z6ezw5vh0j/cJzgcZb/8EK5IkSKrQ7pIRQfNbFJkKsfIwPla8iBxQKKFtx5Vns8arURS6SoaGbxXcogs+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUIc1WAs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24458051ac6so1210315ad.1
        for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773695; x=1756378495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z9+vcQJUI6gFcHn8TkrD2LAj/6hHrhU8RpC0IcDO5Y=;
        b=NUIc1WAsN6jSuZ32mT33EaKMgCb45DICbm6/pSkbw7djx/6zK4WLEkA7jN0sj/jA8F
         CVqdQGGjVEbHLe3YpSdzmyzqw4iq4P/4L7QAXbfmDphC0m+yQrL7KcuMERFEjzhd0ToA
         kwQb6KP+gPeROQ7WPAorPTaFd1r5UVoSAiDgTyeRTEH06nfl0zVXhojhYtl9hkkZSdVt
         vsHECyRjuEyGrn1GMHXrrRJkiH8216CZegmu8e74wk9bGPp4J1JMtkh/qXx43cXzF8le
         DfTWOd1y5nGu8qVT3mpAuMpMDZcooUNu36GZuuNcqPow8hsMDyf84rx4hQkVixFIgXod
         lyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773695; x=1756378495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z9+vcQJUI6gFcHn8TkrD2LAj/6hHrhU8RpC0IcDO5Y=;
        b=w7fK14VAz/ORLxmm/RVw1qk3SKZdD0ZJM2oa82iItE8RDmlu0BxQL/3N8SAZL3I2b7
         IBT4PSltKZQyTyZ1jenqBReJEEL2kB5tekzAa6AwLwraVh8fsIncrdrAVvupogTG22bG
         qIueC0nxv1qig/3L/Yorj/uOFDP3uNb70zwCFvjplMScgJ+8U1A+QkXYOKea9UPJe/ya
         hj+wmAnZ6UGeDcf39JKgczqOx1+zNk1Q0leQUgL2a0u8Fi9SggxfhYyf3FJl1nOedXnm
         +Vemf4Oi4mMnqKIlrCyA1cLC/F7bVzR/oI+hwc8dzP/v8UZyuLlWP/so9mm+WMNKf6VG
         TkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQgFzCy/3dzgP7e3yzbNANR2wmgPbjMKIIs1dLYjowgQjCcpy0F/sSX4rOEvo0i3EXLa16MqsS@lists.linux.dev
X-Gm-Message-State: AOJu0YwH0eBXzQEU1avxz0HNMUyfqE3Eeoq6kXXF6rDr4k4yD+4yIft+
	h4+t2y6vU0VmZgABQJPx4HPX7j+r2YUwE1RDGze9Rj2wXleUAEEW/YP4gLjFTj5SO52k0Hnx3mL
	/LTTM8ThvPS1LwTMo6ukBxhFcjdE9zqA=
X-Gm-Gg: ASbGnctxOwri0jf5+ziYjKtzxXZ0UQLZA2aJO5CuAM6pbnnDKd+JmrXXPlXUF9hnR1d
	H4Wg4vFkJHPva2wqY7v+LzYZq6aTrG6L5jlcVrR5Oer0UIrvjC6rEXnFXBG7TmxaVtmEtsMOMLU
	ERgZDLW+BF03h36DKcoux4/AkG3Ebdw40JrR+Db0xqfk3q2RWb47pNqccjnXmrQNUjvq+elq4Cb
	LyfJARn2rWnh+YzSAI=
X-Google-Smtp-Source: AGHT+IEeaGqbNm0p7f2FlU3KO8H/wa5ghpAWrMUDevru/4vMoYDqRyFQJz+LHOOKfyVYW8tZy/hBZ2T6boIqroqtm1Y=
X-Received: by 2002:a17:902:fc47:b0:23f:fd0e:e5c0 with SMTP id
 d9443c01a7336-245ff86b777mr15086625ad.9.1755773694694; Thu, 21 Aug 2025
 03:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop> <20250818232332.0701fea2@foz.lan>
 <4dae36f1-b737-4ea0-b3d5-6a7784967578@paulmck-laptop> <wznbwwz2lywki34l5bdl327bpvdzvsmiwzjhdfe5ys7e7puwfy@652l53zffvnl>
 <eb52bf02-48b6-43fa-93b4-29d827cfcb51@paulmck-laptop>
In-Reply-To: <eb52bf02-48b6-43fa-93b4-29d827cfcb51@paulmck-laptop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 21 Aug 2025 12:54:42 +0200
X-Gm-Features: Ac12FXw5XGpQchdxQDPPrDaoLlP5Pch9mZx4VEkW3GWvTNoC0ACCX9VJHHpCaVw
Message-ID: <CANiq72k096VkeCNnT4itWkSLFBAHTJL0xmsobfV1iZfDYu26Dw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted code
To: paulmck@kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:03=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> Use of a local service might seem attractive, but even if you somehow
> know for sure that it doesn't send your prompts off somewhere, it very
> likely at least logs them, for customer-service purposes if nothing else.
> Which might be less obviously troubling that broadcasting the prompts
> publicly, but any logged prompts are still discoverable in the legal
> sense.

I think by "local service" Mauro may mean, in general, open source
projects that do not require network access and that would not have
customer service in the commercial sense and so on. Some open source
projects still have logging or telemetry, of course -- I don't know
how common that is in libraries/apps of that domain -- but if so I
guess forks would appear, or people would run them in isolated VMs if
they are concerned about things like that, etc.

Cheers,
Miguel


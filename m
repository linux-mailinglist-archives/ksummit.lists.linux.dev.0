Return-Path: <ksummit+bounces-1223-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780438FE6AA
	for <lists@lfdr.de>; Thu,  6 Jun 2024 14:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D52728164B
	for <lists@lfdr.de>; Thu,  6 Jun 2024 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D2D195B09;
	Thu,  6 Jun 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2zHJuyx"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56191195991
	for <ksummit@lists.linux.dev>; Thu,  6 Jun 2024 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717677445; cv=none; b=hy2EFZ0iXU2Q5B2NM9PQcBLtX3DjbYuPtAx4NBUGHK5Ulu1zIINqf7uWjeI+E2uTpQyVFfCi0S9usT+9DUkpyjb8hRVkdV65UkJTXsraLB7RuAj/KNoX8/YS6utApZHtga0NgDUnVuZGNpSLV5btqZlgUKasLdyy0SCv7I3NGZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717677445; c=relaxed/simple;
	bh=Srufcpxs4f91AONSR9EJCsFxEmxvt8EgR7TentxOAyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sk7Hsg6PNVk1M3W2zn+s/dHZ3ZnKLigrO775YyuAZ/4ayxE5szlNIrqiXGdHn+SjUlJSSg9cobw3N/MiLTnDDdUykowrlDhtqCOKYzGmjrP6zXiFxDPlUSiKw/m3g/CmaEZcPe0faCPNRWDPxKS18vfq1HZLIpXv+U3wJk5px54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2zHJuyx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717677442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Srufcpxs4f91AONSR9EJCsFxEmxvt8EgR7TentxOAyY=;
	b=c2zHJuyxim4BnVjxz6cH0BQEZdmuMwmX9XFuc5W4RzDklGmLI1u+NT35MixXCnv7xZD0Fc
	NfjxTTEFqwhE0SPLOBij2M3pBAcAQ+LdKP6NMsp3Cw9hcuUx4QWXCHnDUPfxrBLLNKnuO0
	DaxNyOB9Slr5qWwso1VjDLJTrS9Vs00=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-hbRqg9HpMyu6V_AWqB0HrQ-1; Thu, 06 Jun 2024 08:37:19 -0400
X-MC-Unique: hbRqg9HpMyu6V_AWqB0HrQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35dcf7d4014so580252f8f.0
        for <ksummit@lists.linux.dev>; Thu, 06 Jun 2024 05:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717677438; x=1718282238;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srufcpxs4f91AONSR9EJCsFxEmxvt8EgR7TentxOAyY=;
        b=lbr5WfrIKaH719S+QmgDXKAf7pcTpW6jHeMIPm/8P4y70isyQbhOhT7Rrufcvp2til
         roj0Q6crzOlwoIqm4pMHYuRn5dKFF3MgVm5QqpqWzHKtle5D/VzsVIV3rpu+UilYpFjG
         Gq60Y4Q5KoZWjYlpQ/nY9Nta7zLz4NdK9DLdIhj3cLO4hTp3BiDm87UlAdBOrxgbU+n/
         xAjw7HwltZ9ShqxwG6n/8SoG/SlNxRpQM/RT7kZ5s9nvzu9pxYc3B58a1fDEQrhgU7Ez
         6siQ5IGXlGDUiJZK7XGaqWv4eIetW2MkeVfsUJsyBHwD6a5ctmRucQ9GWZ96G7WlCWuP
         I1BQ==
X-Gm-Message-State: AOJu0Yyz92cg7lL81OyEcnUe9vVPUwLWHQlnAMlaN6utpx0bZQz9fcyW
	XG/dJn+38NOQeGNUYAHkqAic2wIMeiSnG9ateoBCwrze3Gzbm9Mc4MRsEeBn67JBWyLwF64LZgl
	khlrGbMZfC+bc6m5sFRUfDYCQJ7Fkd66xBzUMzdah6+r2fe/pXdw7kRM=
X-Received: by 2002:a5d:6d83:0:b0:35e:ef46:64c3 with SMTP id ffacd0b85a97d-35eef466681mr3235056f8f.57.1717677438174;
        Thu, 06 Jun 2024 05:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLcDJ7wUg3xDK83wGQUiPbwJxlj7P0SaTRJvWjUsh1nmUB8PVvMojnAJzQmP9i9vj1dZfxaQ==
X-Received: by 2002:a5d:6d83:0:b0:35e:ef46:64c3 with SMTP id ffacd0b85a97d-35eef466681mr3235028f8f.57.1717677437626;
        Thu, 06 Jun 2024 05:37:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d2e73dsm1484539f8f.16.2024.06.06.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:37:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Doug Anderson <dianders@chromium.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Introducing the power sequencing subsystem
In-Reply-To: <CACRpkdaRg7zujpfSLu4G_v8Xa73Y7P0Evv86EiBtUzhTCNE6Dg@mail.gmail.com>
References: <CACMJSeupU_j3bkj8muMrdrYvfnppYdZ4tPvZ+8OQ5A9BpTOWDw@mail.gmail.com>
 <CACRpkdaRg7zujpfSLu4G_v8Xa73Y7P0Evv86EiBtUzhTCNE6Dg@mail.gmail.com>
Date: Thu, 06 Jun 2024 14:37:16 +0200
Message-ID: <87le3int6r.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linus.walleij@linaro.org> writes:

> On Wed, May 29, 2024 at 5:24=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
>
>> Here's my submission for the kernel summit track at LPC24.
>>
>> Note: The power sequencing subsystem has not yet made its way into
>> mainline but as there's a lot of time left between when I'm writing
>> this and the LPC24 in Vienna I think it should at least make it into
>> next by the time of the presentation (there do not seem to be any
>> showstopper objections on the mailing list).
>
> I think this is a good in-person discussion topic, because the power
> sequence stuff is very debatable and hard to get right, I would include
> Ulf Hansson, Javier Martinez Canillas and Doug Anderson (IIRC) in
> any such discussion since they already invented the power sequence
> code for MMC/SD in 2014 and probably have valuable feedback and
> ideas.
>
>> [1] https://lore.kernel.org/netdev/20240528-pwrseq-v8-0-d354d52b763c@lin=
aro.org/
>

Thanks Linus for looping me. I was not aware of this patch-series, I'll
take a look!

Unfortunately I won't be in LPC this year, so I can't participate in the
in-person discussions.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



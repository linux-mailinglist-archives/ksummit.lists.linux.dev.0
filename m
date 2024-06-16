Return-Path: <ksummit+bounces-1300-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0160909EA1
	for <lists@lfdr.de>; Sun, 16 Jun 2024 18:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B34A1F2138D
	for <lists@lfdr.de>; Sun, 16 Jun 2024 16:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330F8381C7;
	Sun, 16 Jun 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bgyo3qSM"
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85B1CFB6
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556028; cv=none; b=eVEblqoVAF5VoJFIyT/nP7TjH0bHWTdQ7OTSvz20lZEz0sgiXfxLfw25SgUEshqtPxtZtXNUC2YOb6DiveBhcgmhtZf4M/kBPivfxMtFVQM3guIqkabm9IZ87fLIG3otyi5VxAGnXErM5HRU0E5I9q2ztBUXTDCt3GuO83uwfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556028; c=relaxed/simple;
	bh=Z/2Gf9/iqljfcNMrQD6YoglKBOy+99gr9M48Hp8OVgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvVmGbvAGRRxL53TJ3ilzhWlMd5DcTD5lyWXNi2+J/kgLBpb1zTG7ts0zxMet1qdfjpR4C9JJuQ73Dya+WL0f3Mes/YG2mMiy9gNXK0phpjMJWt73+eLtIGgp1igsSKI7CdccLw46e4DNL8l/gaw5AEFHF+OvTKp1SWpI7n0ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bgyo3qSM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ca342d6f3so3094864e87.2
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718556024; x=1719160824; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ROgOYfw9RdeU/Jm2b3Hp6quFIAfvM1I6sV4r4U7A/og=;
        b=Bgyo3qSMxbckrq2P9mITBbNo2MyzvMCSGeLHia96WL6+0ZKyvE8aqp1lv+JMtop4V5
         6+LJrz/PTJyr6NmPf37UubfKd2QfQuSbubYdKDa+HwzjQe+3t5hE/ApSZXelRfWYvmzh
         ihQhRif2lyy7x4YGDHugsNGY55OtCEpeo41VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718556024; x=1719160824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROgOYfw9RdeU/Jm2b3Hp6quFIAfvM1I6sV4r4U7A/og=;
        b=A1J3JFGVcgUrM0ZQT0PKCdX6CJJPwc2ZBUwQR9ukMoI72hmo+Nn/0GUx6Sx8gpbg/f
         RXUbMWrTDd2IKo5NMZ98LwKMEW1XLy2YUcMcn27wvTM8Febvhe5Sm0CpumdKoVhVggko
         qunpLL33g8iLHHS8L9ddTTHYRhvh0pEhgSMLX4V3NcKGPPqqtCJXAC0wcUmW6QjntiRW
         NCwNob3Z2vnoqFalUe6vacwWSXpdsy3cguVrPFe/8CYLOMGDULnMthnwToXaKUFmsU+w
         Stu1N5zdaIhHtYn6AEdSc77hNe1zakzguTn6jgeoOZ2i51nUXXvAVUNP+W8qJpsxJNjM
         v4qg==
X-Forwarded-Encrypted: i=1; AJvYcCUS5OwayZV5KNEy+SKjeYPN/hCeMJ9bt1j/RQ/zW6Ri730vaegCif2e0efTlWS/n94+dmqnp/f/lNyYWMcf5wfDiJ6/JXG53A==
X-Gm-Message-State: AOJu0YxIToSXIaVsHIndJIT18JERFFXwh6SKcF1BLC+svkb9CH8VCLeV
	5zzdexqg+OhgbrwmusmohUpJP1amMHOHchulg2Qkj4qkUebjV2hdUSFSqn3ly3Jk0hLIBM1LVIk
	F5h76aQ==
X-Google-Smtp-Source: AGHT+IFoBGM+b7ruHxeBa49vhrRwhnw8dJDYRWnxENPmsbNbL0Nwbcgnvpt5rODPaHkTQL+bqeQIOA==
X-Received: by 2002:a19:8c56:0:b0:52c:90aa:444c with SMTP id 2adb3069b0e04-52ca6e64b38mr4673633e87.28.1718556024263;
        Sun, 16 Jun 2024 09:40:24 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287aae2sm1015613e87.219.2024.06.16.09.40.23
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 09:40:23 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebf961e504so39125461fa.2
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 09:40:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXNUs/vzLiVhThQGgFxOqxvK2INf4BRxL7yQ3WqMiW8cb9Cz5fNlsiMAaXjX3OZ+GUoJm7Wno/3FkjXcUrhi7pQaCPuRWQhg==
X-Received: by 2002:a2e:be83:0:b0:2ec:1042:fb00 with SMTP id
 38308e7fff4ca-2ec1042fbcfmr54521371fa.9.1718556023031; Sun, 16 Jun 2024
 09:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com> <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
In-Reply-To: <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 16 Jun 2024 09:40:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4Rq9QOEdwNL3XPgPEiLZRAFqfdgmDxAEpn_ba19KXpA@mail.gmail.com>
Message-ID: <CAHk-=wi4Rq9QOEdwNL3XPgPEiLZRAFqfdgmDxAEpn_ba19KXpA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Jun 2024 at 01:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> These days, it's mostly just that I have set am.message-id to true years
> ago; but since lore is managed by kernel.org, we can expect the URLs to
> be stable and the original reason to use Message-ID is obsolete.  Having
> learnt right now about the applypatch-msg git hook, I've stuck a
>
> sed -i -e 's,^Message-ID: <\(.*\)>$,Link: https://lore.kernel.org/r/\1,'
> "$1"
>
> in there which should do the trick.  I guess Michael and Takashi can do
> the same. :)

Please don't. At least not unless you are *SURE* that you only pick up
those messages from lore.

IOW, where did that original brain-dead Message-ID tag originate from?
Because if you use "git am", then using "-l" already does the right
thing.

So the actual fix is to *NOT* use "git am -i", but "git am -l".

Do not fix up the mess after the fact, particularly with a script that
can actually corrupt things and make up links that don't exist.

Just fix the mess at the source.

              Linus


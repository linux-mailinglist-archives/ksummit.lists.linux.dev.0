Return-Path: <ksummit+bounces-1288-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F9909AFC
	for <lists@lfdr.de>; Sun, 16 Jun 2024 03:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B99282C45
	for <lists@lfdr.de>; Sun, 16 Jun 2024 01:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E123D525D;
	Sun, 16 Jun 2024 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SeSw0OqA"
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC11C33
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 01:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718500460; cv=none; b=lrp1sCSoAwD7ZyLzSinJzLuLmIYX+iBRj2jyptVygz+mq5OvmAFTP+GxPBR6cZBZYF2RHlasMKPWpJEyGe0ILlWlTFu4DOQvbKiFzOBXRTECUqe1kqQfRfIwPCogsVv00ojOUqaEzu9ODlrRYQRwuYk3BPeUMnytU8znXb9JJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718500460; c=relaxed/simple;
	bh=GUJSEuSJbSCQeBPJfovMQ759rtdhPhkeJv6wI3id3no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFcXaRD/XV9pEhhlesz4W6edaxaVMO2SwiG4tu9QMsZhM8+5hH4o9Skxo3dt4df5ib5pZZH3cpw/n5RIoSqV9GyeXO+qD4ltuT+GzyyoqMkEP5GA5ZmkvsxlZT/248fd+h0hJdAN4kOlDLSwFqgGBh7OFg1MZdXP83TBWbkT3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SeSw0OqA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso3559645e87.2
        for <ksummit@lists.linux.dev>; Sat, 15 Jun 2024 18:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718500456; x=1719105256; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjLuS8R68aRxbfDmEWBzBp4ukhbt8kUd5wkSmzYZbxI=;
        b=SeSw0OqAwkLbKOjpsrROzbd/KzCXe56M64j32MGEnN2UCh5pTt+XP+66/630o63PWJ
         G+wlKj2Mi5KCOHqvHxSKoZ/v+WjYCbM+KLdHAbtS3YTl3LU1OK0WlpeUsfGQEDEfQLL2
         iJJHxkR6nnrAxAusFXW7iBVTZEgGxGJFJQDQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718500456; x=1719105256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjLuS8R68aRxbfDmEWBzBp4ukhbt8kUd5wkSmzYZbxI=;
        b=mP1sxbfoDN5tKSPl+gyb8m/b3UrD5niS3ZM2f5Fk18gjYRPSA9ndw1yeEfn6woesVE
         A9atJM4oydudco2F+aBZvqi2G+xnS57q91vqF8xOMt1XUlrWM9DBL9zYJAfihSR6H0zt
         V/RaLPE9/K4F5Ge3445xljaymMWraJorD9XsWy6nk93DKu++uPuboY3Dz7onzUUOftky
         lhPM3Pc14+NZQwD55e6G9CXjfXqOALMGU+B9uaz95Z+VkZBN7IseCmK+vD85myaIaEpj
         Hi3ZMDMHuUcxmC7AED5sKKi9VDE3Ec6WxtJ7DBuo5SpCipntV5PTuyPQA0FX2cw5raSe
         tyYg==
X-Forwarded-Encrypted: i=1; AJvYcCUc/qjffivvCKlyMqj2qMNn5MwVEpQuR7H9VW3vRBVVFX7JPCumJu3OZ+OinVIsM/pumwAbLsuHaHQvLmijuyNJcXNSrQsjcw==
X-Gm-Message-State: AOJu0YzyJjNd7XJMk1k02GFUEfGXjGEnE+E4rnCENQFuIx3X3PDOg+TB
	D8Akgd49+aEcDEMFwuzX0suArDIiO3fW9CvNn2Of5TRKOoIbxoDuhb/0JEyiuPs1mSrfhF7zVcq
	OxKM=
X-Google-Smtp-Source: AGHT+IGnRhSVoZDyK/oyxrcMod/QYtD76aEpwt9d6LD1zcb/SiiKd5dsbMTKFHLnorvppViLxPCtfA==
X-Received: by 2002:a05:6512:3da0:b0:52c:8ddd:7beb with SMTP id 2adb3069b0e04-52ca6e55b38mr5353358e87.6.1718500455868;
        Sat, 15 Jun 2024 18:14:15 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3fc4sm354239366b.9.2024.06.15.18.14.14
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 18:14:14 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so543017a12.1
        for <ksummit@lists.linux.dev>; Sat, 15 Jun 2024 18:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGX3zahSxqs8Ho1+nof7ZgGyLBgTnhGOeFf4ijAXrFA131jWpVOAda4wIA60NIGoWXwwZSEg4YTxDCn/AhTEy1AqWbhF2cqg==
X-Received: by 2002:a50:f610:0:b0:57c:8bdd:2d92 with SMTP id
 4fb4d7f45d1cf-57cbd681bafmr4005681a12.10.1718500454399; Sat, 15 Jun 2024
 18:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
In-Reply-To: <87plsjoax6.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 15 Jun 2024 18:13:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
Message-ID: <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jun 2024 at 07:29, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Message-Id: sucks, I want a link I can open with a single click.

!00% agreed.

There is no way in hell I will endorse adding more of those completely
*idiotic* "Message-ID" things.

Yes, people use them. It's a damn shame.

There is no excuse for that completely broken model. It's objectively
and unquestionably worse than having a "link".

Here's the thing: if that message-ID isn't public, then that line
SHOULD NOT EXIST and is an actual real problem. I personally look at
those, and go "is that actually available on lore?"

And if that message-id _is_ public, then it has a link, and it's much
easier for people to check.

Ergo: there is absolutely zero reason to ever use Message-ID.

People need to stop advocating that sh*t.

And no, I'm not at all happy with the fact that apparently vhost and
kvm has made it their thing.

Paolo, Michael, Takashi, please put useful links, not those braindead
message id's in your commit messages.

            Linus


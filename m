Return-Path: <ksummit+bounces-2233-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC848B386B3
	for <lists@lfdr.de>; Wed, 27 Aug 2025 17:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C545D7A620F
	for <lists@lfdr.de>; Wed, 27 Aug 2025 15:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBD429B8F8;
	Wed, 27 Aug 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHaCHU41"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A28156C6A
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756308712; cv=none; b=TrWwUaGzzvE3jb3z5lfNUzlKK306fFrC0gH1ngVm5l9E6GQsdSAFYEBvrTXRd3gGBpb7SFRABbGV0rGhhg84Fcnjeq6mJAUDp3vodvZZRv9XVFb4BbsM6bq+EKDaOxGG++rLF+wfGzum0IVNxXvbOqR+CE385F5YrA2ZEDovdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756308712; c=relaxed/simple;
	bh=mY934ZzTbSRUzwzhvm4GwZvUEUvLhLcwdjan4AL5eck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz+DEg4C3EbnuJdzFIr2WnwuO/WSEtmXwTsMgwEscDsGxvjqz4zHMjAz3cdKzhfaWU+N82kBKsmlK0MGAntWa0OCmVyHo/hYYR6svJFTvniBTtsdan4WP6vDpKTwpMfzgHjsUAM3rFQMOHU15s3X4qUrAzuh45mSFP5a3J835GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHaCHU41; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb731caaaso1038788066b.0
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756308708; x=1756913508; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iVYqlkkhgVrHHKWyq5bfwCsYCJYQkxjzO7UzXn6ecUo=;
        b=CHaCHU41YIw9My+N6MKMOP1shLPdmSRo9IUqA0pjLYybTNK7yDNbJvpd8xlZw4mp+I
         U456ePb6oXyIAWqB7GkgPeFytAAxBQovh664YW8G/6f86XidG37BiLlf/c1QiaHsIRtB
         1LHO7vfpcM8c42tlRJkpLM7lqn5sr3aJWR+6jsWIdx9O6nO1pUFtAq6f0x2Tibgf+Cu2
         4BUx8JQnd12QnQ93f5i6xnhOhBFWnFUatuhzyZG53qe7pDY6PV8K1LSKXaSsOEJwKd5N
         ihCIeHPAvZaVVAMCZ8N3PqnAVgIoqRTG2YCYfS6j/c6QDDQZ83F4XvU1ViS8064EyGwV
         2RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308708; x=1756913508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVYqlkkhgVrHHKWyq5bfwCsYCJYQkxjzO7UzXn6ecUo=;
        b=Sm+QU0cHC57CtodYtloDtRCz3tVJQQRr7uo5NW0Q6OXkHfy/RFFM+78kgYcJPx9dcn
         jmwOIQUW784faDybwsgpUR1DZK0lMr3+nCPzHXHjqeRvqWcA2+7UVpOtrYWlyNq54pMU
         ZHQmhoTqQaTVPRxlJyrE52Hrnmu2f5KFJHLvGcO7FKrD8Ttsc+nqNM+DIOz6E1Sa0z1z
         WlZXjGAQgv10QADxslGV1OBipEiCjb/IxsMs3OfQ+y6aCGFwFbfuRbTQ5s30Ic1cH6aa
         YSR7RlAhHZjSK4X1dHMPyY41NHBMKHv9bY3GOleqEeJGlwpcdIYZIf933x7Q7fg4ev5O
         u2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWVoAZzdDwguyrQ1Ye3k0rSIlz4L0y7Vx7NWiRgyeVmEfp+6XltLgV59tKOC45eftkIA9BO8jmY@lists.linux.dev
X-Gm-Message-State: AOJu0YydZd0aYgD68xXySzUnoO9SsXMLAu0r+VxvKj7uBWvZOvicNmRV
	XYJVm1vMBmsU7034POKxo9mz7zwFSG0UJC1X5gUiWBrUNVsLQ9Mo+A//p0IqEyBn6YAEESpukxM
	4dYx5ka5tm1E6MQqUYkKpLF9+LzxJHRgIJJPEJHvkN+E+6IUizzaSewA=
X-Gm-Gg: ASbGncur9PopNsbSLP5CD1PDVCkKOe4/IAZzlCqwBqthreyeYqpv1b3IKfKEAiNW2Cl
	QCELsuIkj+5sFwfD/gbyv2EQ7PeSW/aAMyOEtWobsasASlHGQTrBFpST9ye1v4OZBTGhzzTF9Zs
	DTONJOqrmJqhP4ZHhtbEpv/THZMT8gJ4+tBINV2eAXArSoqZXdPZJ9AxHCZB8PyfHkjQSdJPfod
	XLQFAHhoQI67HO5PrO4+5JmlDBfzraENKdBpBY=
X-Google-Smtp-Source: AGHT+IGxJNNUaE0fprFErPKUGxi2uusZ5yw1ST8pdm7SeTdILtdQlg/9sU/GPkBniFe6MFMFYhlH7mXQ+dTFwjYrGu4=
X-Received: by 2002:a17:907:3e08:b0:af9:a5f8:2f34 with SMTP id
 a640c23a62f3a-afe2963b046mr2066539966b.53.1756308708250; Wed, 27 Aug 2025
 08:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com> <e5e72565-6421-8f1e-50d2-6deecc303faf@inria.fr>
In-Reply-To: <e5e72565-6421-8f1e-50d2-6deecc303faf@inria.fr>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 27 Aug 2025 17:31:36 +0200
X-Gm-Features: Ac12FXz5RCRhZp9atbgaizCVrEMUv-Y0os2iriugSl94KzXN4BN74KU-WbEFeos
Message-ID: <CACMJSev0yRtCqr9YuHkN8ETyzU6_4bhuuX3ykLXNK8Z0eR1TvQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 16:58, Julia Lawall <julia.lawall@inria.fr> wrote:
>

[snip]

> >
> > And to address your last sentence on a personal note: thing's arent
> > always so black and white - for me: I inherited the GPIO subsystem
> > with both the old and the new API already present tree-wide and am
> > just trying to improve the pre-existing situation.
>
> Is there some centralized place listing what APis need attention and
> giving some hints about what should be done?  Hints could be text or
> change examples or pointers to commits where the change has been done.
>
> julia

There's a TODO entry[1], a talk where I described the heaps of
technical debt we're dealing with[2] and lots of patches on the list
called typically something like "convert to GPIO descriptors" and
which look like this[3] or this[4] so quite different depending on
circumstances.

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO#n6
[2] https://www.youtube.com/watch?v=BR41Yg69c9Y
[3] https://lore.kernel.org/all/20250808151822.536879-18-arnd@kernel.org/
[4] https://lore.kernel.org/all/20240423-gpio-leds-v1-3-799c2f6bc61c@linaro.org/


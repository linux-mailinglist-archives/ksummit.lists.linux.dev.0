Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF17D749B
	for <lists@lfdr.de>; Wed, 25 Oct 2023 21:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70522B211A6
	for <lists@lfdr.de>; Wed, 25 Oct 2023 19:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC031A7C;
	Wed, 25 Oct 2023 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DubXz9pL"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46831A71
	for <ksummit@lists.linux.dev>; Wed, 25 Oct 2023 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9becde9ea7bso274196066b.0
        for <ksummit@lists.linux.dev>; Wed, 25 Oct 2023 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698263045; x=1698867845; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JeXrnJe8xvNfcrNS9vywqBs8RswX60g4RVbYr0154Ac=;
        b=DubXz9pLLxk6NB125Um+cKXdxzYLvFDULY/ag9jJ7rM+se0N1XAjd1r5wgHpXqG/xv
         /CJcHF+7VKEUPBjqb6qN4nD3NbzlbyYrthaxVkFnLCjcZ2fwQ9Wt9++wPZjYBuYIfJGK
         vFjCJ754v6Kyrvacfdy+BbAhJOFb/eIzPkrzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698263045; x=1698867845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeXrnJe8xvNfcrNS9vywqBs8RswX60g4RVbYr0154Ac=;
        b=jFVUDnwu+T4suod5AYOydE8PgRFH+5MQ2sOdcYG/+DD/ErIF/LrODTToc3/khptuXj
         FGtJxNHOWXPBS+RPcdQy/rmG1E2JrWbBg+fB2o3k3JGVBT2vCh94gnnIxp50HddpJJ81
         tHaSK0fzNf5RPzfuK7CgX4vKMUGqqe71sLZZA05mCFWJqfKUw22KnMKXnzwIBaJTlABO
         P7zfAy8CoTbc8i2y0x8E/Hp5ZbVDfChIWPUUpt4ElVRfAEPMyOQkih2LbYu71fntcpiW
         W7IGFpBvZr+8eW11AgtnvtljzVuouUp5ZkZASDEMmEjqYMGzrwOLM3t6Tq6Coty+4mBR
         zbhw==
X-Gm-Message-State: AOJu0YzGd3wxASxsHyCuoOVXIgNmez853TLIifew9nS/L6WcKzBIeft1
	bzcby+MWkMx6r75ukk6Avy7dKxisT/JoS0ut0ug26ZBI
X-Google-Smtp-Source: AGHT+IF2AI+GcH8oCKVsS/SOjyF2ERJ6m1nBgzS3b5eXZML18EGoFzfg25f6fkeaRoB1Wu8iKyvdYw==
X-Received: by 2002:a17:907:9618:b0:9b2:be2f:e31a with SMTP id gb24-20020a170907961800b009b2be2fe31amr707506ejc.31.1698263044850;
        Wed, 25 Oct 2023 12:44:04 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id jg36-20020a170907972400b0099d798a6bb5sm10476244ejc.67.2023.10.25.12.44.03
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 12:44:03 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9adb9fa7200so22893166b.0
        for <ksummit@lists.linux.dev>; Wed, 25 Oct 2023 12:44:03 -0700 (PDT)
X-Received: by 2002:a17:907:9492:b0:9ad:8a9e:23ee with SMTP id
 dm18-20020a170907949200b009ad8a9e23eemr587581ejc.13.1698263043242; Wed, 25
 Oct 2023 12:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
 <87fs1y8xkl.fsf@intel.com> <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
 <20231025141030.63acb006@gandalf.local.home>
In-Reply-To: <20231025141030.63acb006@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Oct 2023 09:43:45 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
Message-ID: <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Oct 2023 at 08:10, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I think this is the key issue. We only want the context of an email that is
> being responded to present, and the rest trimmed. Automated trimming or
> collapsing doesn't do this well.

It's not just about MUA's that hide things. The MUA _I_ use hides
excessive quoting, but then when I look at the results on lore I often
get completely unreadable results because somebody quoted several
hundred lines of patch or whatever. And then I scrolling through the
thread is suddenly a major PITA.

So I do think that the whole excessive quoting on the lists should
just be a hard no, the same way html is.

                 Linus


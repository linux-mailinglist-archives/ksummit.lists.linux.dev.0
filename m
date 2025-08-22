Return-Path: <ksummit+bounces-2199-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BDAB310DC
	for <lists@lfdr.de>; Fri, 22 Aug 2025 09:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A401BA560A
	for <lists@lfdr.de>; Fri, 22 Aug 2025 07:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677152EA48A;
	Fri, 22 Aug 2025 07:55:46 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53651A9F83
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849346; cv=none; b=chlai9LHutcbqNTGLRiLxkEDXW8KtSFV5l/2prQIm/O6+4WLdJTSqZuEA+0gLvRnKv5MlY6wsdVIgS4+PqqZYoppb0kQdHYguAETUbqZiYYqE8SbossoxdPIJOdIeialsYNB7HmX7QPGP0odx0+cSxy8A/T9CmqY3BODjChxY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849346; c=relaxed/simple;
	bh=hSxeeL7rqH0iYrBir1rtigRDh8j8yvKVchdhGaKt+Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f420uhDZEJ8BPCJ8fkeqaoHJMEZQlZOySb4CPPvQ2rFBitWkJkZEnRriycoYgdUmaIpXSqfXFZ++rc4rwkSkgHlh+bxPcaPHSRvAeYOSfdTiGGRYQJjs0BVbnwcv5qkR7gofLIg8xJcksYEgQeU7VMUUGOelFoEkj8Y656PtsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53b17534eeeso694255e0c.3
        for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 00:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849343; x=1756454143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pzy3SbV1Ua51Cyzv9i2qs3KCYdpJxSfZXvl0EhaqU0=;
        b=argCkpMRStBSpxW2Q39KE7C5NHr3i2x5OcP4eBmbIiHXX4nrp2IGtLoF7oFi+5I/zR
         NkzuaV3gLvVMcCKPewBazNr6LUCdH2dwbWpxT68hwkoqY0JmcKGmNgbEGxSHO/k/Wk+U
         W6uVtVAQv/TkB10FF5r2SgqY6Qx5Zt+aKDs5HBvnSBaE1eH0s0/jdgOiCsMNR0h5+BaT
         wrpr/h5cJgSerRgwqU6gUvm11kLUyHxmMJ0MofMHY/NCGB+M1kAhMjIZ+zT3OHbgA4fY
         yrLKdQg5rp8P/+3Pa3eltxkxbrX5kyRlbQDeEsTsRZB3bJfPYEMksN18ysF1YfvgBT79
         u3sw==
X-Forwarded-Encrypted: i=1; AJvYcCX2JU8QHX0Fg66u87LRJkouA9bwf2wPW/OyJQ4R7L5JueAMRlN01pkY2TVFp6FqDDWYak3xj7Jc@lists.linux.dev
X-Gm-Message-State: AOJu0YwmLDMQuTd+XB33v4TbXj5uXM9SQjgXfRHn0d65wQ4Gzrv/5quV
	RF5OFPKoKr5Mf6D5ua5K1DRoZKw/91TWFHNQnM9L/xVfEeTX2Xt1dUD/VjGWoj4k
X-Gm-Gg: ASbGncudZUZ2Mam8Of5J212kkr9gIja6MhSrbvcP4/m81GBB98N6SnZKqWoMW0WKWq5
	qOhJVo3hK0sIbXULpassqdTCla/9bcTd/KfAtQr1jno8wvkFboLdstRnmiBdE97NXcGp6/NmqIO
	OiRb3q4psU620iwU11S3Pft+xVMHPBFgehbkhGgziAMKp/H0cGNUhulQnefLvoXvWdL4ecTyxch
	JrbDBpZEP7nWv/6Pxq5ODhzmdX4OPeS9J5WH6mZi9ls8+8UA2wO1LKrljlJFWJh2RDhs41wKHAD
	Z4NQN6pJLE6K6qWnFZZSnRHoZAWITcYCckM72j17A/fZ7DyQiJO6VXjO8kh/bummNDxgFdB83+m
	liLg8PlVQKPzRqPmuvB5qyUE+YtTnvukyCcczr2K9dFNv3s+sP1uSQHOSwDnf
X-Google-Smtp-Source: AGHT+IFuNGSx6aN/7R+7wSZCLljL8mNBTocd05mz5jli7YUhIJBLOKe3ugZHJE1xGbcPmBCHMD+ZrA==
X-Received: by 2002:a05:6122:2217:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-53c8a2b1176mr529008e0c.3.1755849343400;
        Fri, 22 Aug 2025 00:55:43 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bddd926sm4142935e0c.14.2025.08.22.00.55.42
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:55:43 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8921eb4befaso306045241.2
        for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 00:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlJEA+asbrrKLUoRAkWkhFb2TaZDMC/JN37MZWY4IeeGJ/vghylTT5dTdOHrgnOzti/nuOwxQ5@lists.linux.dev
X-Received: by 2002:a05:6102:4a83:b0:4fb:dd65:b97f with SMTP id
 ada2fe7eead31-51d0f2f9a12mr564332137.23.1755849342283; Fri, 22 Aug 2025
 00:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop> <20250818230729.106a8c48@foz.lan>
 <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
 <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
 <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop> <20250821122329.03c77178@foz.lan>
 <20250821125037.5cf5be3d@gandalf.local.home> <20250821193041.398ed30b@foz.lan>
In-Reply-To: <20250821193041.398ed30b@foz.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Aug 2025 09:55:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXwxQ-pWVZf8nMnb4voA4KFGZi8ERCQZ8pYFc8PkgQ1w@mail.gmail.com>
X-Gm-Features: Ac12FXytzpGY2Z_FqpxVfnkQkeHVSF0C3K6Crx-rlkbYrFVcmnU3UK2vIwDQx2c
Message-ID: <CAMuHMdUXwxQ-pWVZf8nMnb4voA4KFGZi8ERCQZ8pYFc8PkgQ1w@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted code
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mauro,

On Thu, 21 Aug 2025 at 19:32, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Thu, 21 Aug 2025 12:50:37 -0400
> Steven Rostedt <rostedt@goodmis.org> escreveu:
> > On Thu, 21 Aug 2025 12:23:29 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > Many of the AI players scrape the web, and might well pull in training
> > > > data from web pages having a restrictive copyright.  The AI's output
> > > > might then be influenced by that restricted training data.
> > >
> > > True, but this is not different than a developer seeking the web for
> > > answers of his development problems, reading textbooks and/or reading
> > > articles.
> >
> > The difference I believe is that AI is still a computer program. It could,
> > in theory, copy something exactly as is, where copyright does matter.
> >
> > If you read something and was able to rewrite it verbatim, you would be
> > subject to copyright infringement if what you read had limits on how you
> > could reproduce it.
>
> Maybe at the early days of LLM this could be true, but now that they're
> massively trained by bots, the number of places it retrieves data for
> its training is very large, and considering how artificial neurons
> work, they will only store patterns with a high number of repetitions.

How does it know which are reputable sources, and which are garbage?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


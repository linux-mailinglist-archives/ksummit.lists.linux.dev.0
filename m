Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 862527DA089
	for <lists@lfdr.de>; Fri, 27 Oct 2023 20:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80A5EB214CB
	for <lists@lfdr.de>; Fri, 27 Oct 2023 18:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9323CCFA;
	Fri, 27 Oct 2023 18:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMbCYCIh"
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8973D3B3
	for <ksummit@lists.linux.dev>; Fri, 27 Oct 2023 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a6190af24aso384838666b.0
        for <ksummit@lists.linux.dev>; Fri, 27 Oct 2023 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698431547; x=1699036347; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wL6rsP27kyhBgPNjGAE37z4bXgSpgcwn8+JkklueuV4=;
        b=gMbCYCIhOEus8Ynm3pcxDRA/ck7PFMmkjbo5TnkiuG8iVbUBd/znKeOOHwwqAYhtOT
         PX07NzzXQfkLI9PO8GdsxyUUxxgbJRFEcjvmw13zdZM4QXGIfJN1fuu0d/R9hatVIhAL
         S4LjyYuBag8fqKNh8N6J3AyRwY4LBs2xLN9H4tkMwxKnxa7LaZUVidNu9uMPn7KjJwfM
         JnOpf6JxtNw9982X1Z9ppKpPVWjHpnJlBaweZqA+6N7zKBLznk7priURt2y4LTlmUysh
         e0QETC7sZVRti0eB+dlMM169IgF5nFSL02u1+NXSNl6Cqoxcg/6TD3BX19nlypDArEMe
         LgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431547; x=1699036347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wL6rsP27kyhBgPNjGAE37z4bXgSpgcwn8+JkklueuV4=;
        b=jPGS8djRuOo56+4vi7BW/lw1W8T9FdOmEneW3arJgsKQL09ovm6PFuAsuAIHZvcySh
         qNpU49oGEuKS4wTWMPHMcIolYfvqqYhMBgt8DRI7/vJoNexV+qQu0vr4fKq/n7RFWyh2
         27V3pcP3j11NAS2xw5JlRezCGXF0Ha8KTC2Pii2ct0+9Z5GX9LJADN9q+Z0Xqf+uAyH2
         uBKZz8hcqEK5JvtZpBkIeEOqITt4GbNGqY/bikJsq0B7gHJNVlHhC36Xg/Ki0w7MYQ1a
         /rOaM0qqBqUOg2B6WuEWwXRFWFhn7KF9e9rv6wHEairXr+rpN7JF/w0rpOBl81laZgs5
         eixA==
X-Gm-Message-State: AOJu0YzjMdithPLfsTQyidQ2lUFUgdA1Y56ouWjclOxXQI5Wq4aVzMFD
	cpgj+KUX+xoQt8/FKsGwvA==
X-Google-Smtp-Source: AGHT+IEseHwXORBr9sJ631o9racXkSS0mpkOkeFDiKUjuXjwWnaaKLPyzrP3KLBhmO4nUsL9dB9gVw==
X-Received: by 2002:a17:907:31c1:b0:9bd:a165:7822 with SMTP id xf1-20020a17090731c100b009bda1657822mr2862145ejb.47.1698431546635;
        Fri, 27 Oct 2023 11:32:26 -0700 (PDT)
Received: from p183 ([46.53.253.206])
        by smtp.gmail.com with ESMTPSA id gt11-20020a170906f20b00b009bd9ac83a9fsm1571360ejb.152.2023.10.27.11.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 11:32:26 -0700 (PDT)
Date: Fri, 27 Oct 2023 21:32:24 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Christoph Hellwig <hch@lst.de>, Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <c9dd71ba-bb29-4e2d-b8cc-d49d493ffb32@p183>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de>
 <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
 <202310201127.DA7EDAFE4D@keescook>
 <20231026100148.GA26941@lst.de>
 <710149630eb010b18b69e161d02502bc3b648173.camel@HansenPartnership.com>
 <20231026095235.760f5546@gandalf.local.home>
 <CAMuHMdV9CcjGkpF=FGe_U5XtbF08bKTEYkPSxArO1zBwnug0Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV9CcjGkpF=FGe_U5XtbF08bKTEYkPSxArO1zBwnug0Wg@mail.gmail.com>

On Thu, Oct 26, 2023 at 03:59:28PM +0200, Geert Uytterhoeven wrote:
> Hi Steven,
> 
> On Thu, Oct 26, 2023 at 3:52 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Thu, 26 Oct 2023 07:39:44 -0400
> > James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >
> > > While it's nice in theory to have everything documented, it's not much
> > > use if no one can actually find the information ...
> >
> > Does kerneldoc provide an automated index? That is, if we had a single file
> > that had every function in the kernel that is documented, with the path to
> > the file that documents it, it would make finding documentation much
> > simpler.
> >
> > Maybe it already does? Which would mean we need a way to find the index too!
> 
> ctags?

ctags is a tool from previous century. It doesn't help that "make tags"
is single-threaded. It needs constant babysitting (loop-like macros,
ignore attibute annotations which masquerade as identifiers). I think
"make tags" became much slower because ignore-list is one giant regexp
which only grows bigger.

> Although "git grep" is faster (assumed you use the "correct" search
> pattern, which can sometimes be challenging, indeed).

I tried QT Creator indexing at some point (which is parallel), it needs
to be told that headers are C not C++. I didn't find a way to tell it
that .c files are C too but F2 jumped to definitions quite well.
Also hovering over identifier/name works (being IDE it understands
popular doc styles).

It can be made to work reasonably well provided that you did "make
allmodconfig" and added few header locations. clangd parses like compiler,
not like human and kernel uses a lot of CONFIG defines so some config
must be chosen.

But I need to recheck all this stuff now that new version was propagated
to distros. It should be better (and less segfaulty :-)


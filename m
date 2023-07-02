Return-Path: <ksummit+bounces-946-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F233744C48
	for <lists@lfdr.de>; Sun,  2 Jul 2023 06:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9815C280E74
	for <lists@lfdr.de>; Sun,  2 Jul 2023 04:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8117A50;
	Sun,  2 Jul 2023 04:57:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290BA31
	for <ksummit@lists.linux.dev>; Sun,  2 Jul 2023 04:57:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-992ace062f3so387474266b.2
        for <ksummit@lists.linux.dev>; Sat, 01 Jul 2023 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688273820; x=1690865820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF2Dl/C659ZymXAfFRmxe5qYFLuTTGXZLxeDAcoXQD0=;
        b=HEXpK/uduBvbMv3ULT+NHGpkuHw8CG81dKdHLBZfVWLgYVNUUpztjGVkplOUNfM834
         Da13IwZ+VjSE9Ir4E9c0lnA3mfO67rSAkqlk+Kf7ymFajS+Rfl8ObOpwjO5CNczfYaMH
         H+t9g4t9LzbC2C63PN0RBIv1AD3TC8UEyrmc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688273820; x=1690865820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF2Dl/C659ZymXAfFRmxe5qYFLuTTGXZLxeDAcoXQD0=;
        b=VgbKQYvLCD/WFjFaaBCO42VIgSOA4KzVc5UG7BHcwSlK74cfPa1BIypLzK/+HUvtC9
         NfO2jEA9tfD73QMYP8dvQMn9vGigyIObLZ6tPmno7KEErw9tTZO5K5352tKfp6XTBd6n
         5lOKJtZL4jPsZhbolczNKXWubDzb7AeVFHkHoB7AF4JOJKvjrmDjaMq/ZKu5SZ6FL0d0
         HAqNYctJzaI69sdIr5cqpDqBY3ndUU51qcfzjFYoINTMr5sIWZHw5WRwizVKAwRjPo9k
         anEt34YMkextsKsOMVL8BZqA3TfSVzWhyB7YqQFjImxXRIXQIVdRR0JXnnwIGM8yHiPV
         w49w==
X-Gm-Message-State: ABy/qLYtx1VbYyYJMpZ+eaUdHu9F7jSat7aMhmJChCt4OwQyZxeY13BP
	K8GfrM6U2aG58VOIkuFSqR1EOy4IguOSSJzeXfp6/liE
X-Google-Smtp-Source: APBJJlEhSyYjsN9hl3nyRIfubu8V9CwbhC7Mb8rmThKIDghmPn6Wm5zQRJwqaWQiPatf+AJmw/PEFA==
X-Received: by 2002:a17:906:a053:b0:992:42d4:a7dc with SMTP id bg19-20020a170906a05300b0099242d4a7dcmr4939395ejb.21.1688273820575;
        Sat, 01 Jul 2023 21:57:00 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id qq2-20020a17090720c200b00992aea2c55dsm3863185ejb.153.2023.07.01.21.56.59
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 21:56:59 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so4126970a12.2
        for <ksummit@lists.linux.dev>; Sat, 01 Jul 2023 21:56:59 -0700 (PDT)
X-Received: by 2002:aa7:c6da:0:b0:51c:d01d:ce7 with SMTP id
 b26-20020aa7c6da000000b0051cd01d0ce7mr4546240eds.33.1688273819343; Sat, 01
 Jul 2023 21:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net> <20230701214603.6d0b299b@rorschach.local.home>
In-Reply-To: <20230701214603.6d0b299b@rorschach.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Jul 2023 21:56:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
Message-ID: <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Jul 2023 at 18:46, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> This is similar to using flex and bison, where I have the files they
> generate prebuilt and checked in so that the user doesn't need to do it
> when they build the repository.

We really strive not to do that in the kernel because it's too painful.

Yes, we used to. It was a disaster.  It's versioning hell with
different people having different tooling versions, so the "shipped"
binaries then end up constantly depending on who generated them if
anybody does any changes. And maintenance gets to be just more
painful.

So I think for lex/yacc we simply always build things now. No shipped copies.

We still have things like the aic7xxx scsi assembler thing that we do
*not* make people build, and so we have shipped pre-built version of
things like that.

But no. We do *not* want to "solve" some documentation thing by
including pre-build data as shipped files. It's a disaster. It always
has been.

It's just really tedious and error-prone and ugly to re-generate them
at random points.

We've been walking away from that broken model, not adding to it. See
commits like 12dd461ebd19, 7c0303ff7e67 for the crypto layer, but
perhaps more relevantly, commit 833e62245943 or 29c833061c1d where we
got rid of some old traditional flex/bison generated files for
Kconfig..

Or commit e039139be8c2 doing the same for dtc files.

IOW, we've been down the 'shipped' file path. It's a mistake. Let's
learn from our past mistakes, and not repeat them.

          Linus


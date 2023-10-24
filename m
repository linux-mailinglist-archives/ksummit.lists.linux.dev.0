Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A87D484F
	for <lists@lfdr.de>; Tue, 24 Oct 2023 09:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C65E281735
	for <lists@lfdr.de>; Tue, 24 Oct 2023 07:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3DC1426F;
	Tue, 24 Oct 2023 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836C13AEE;
	Tue, 24 Oct 2023 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b2ea7cca04so2923195b6e.2;
        Tue, 24 Oct 2023 00:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698131981; x=1698736781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoyfqL9xvTo4TOT00Ugl9s8iTQc8bsijATmwRynbRy4=;
        b=hwfmWrv77O8oQaMUGcMla1kkG+BbAYS3WjoUMIfProJDBnVFITnliishX+RSsk6D3q
         qZYRGvQK3i5XCzpWLYPtH9qlKiTB8yGhE+eRSMpzz/+kVCssKP3ElHQc32m+Ww4neObz
         3wrEY4fK66UGg/jEhRfsNjwBEY40v5y+MAhvAX6GNE0PZIdL8YHE/TFxffqiesiO1uVX
         B7wD5HUqp1bWZu1Xd2aqwDhNnf6wQ2f8ncWWOFlA7F0qrQaqB5C5kd8OJuTmbic8XUOI
         dHqqDYfy8IenAjTcVYnYxpRkY566kNyKglJjLG/fh8PPtQ+3jXXm/50sgu0cXHYUKUHK
         SAvw==
X-Gm-Message-State: AOJu0YzZEIb+kapYqfQ6lObWxt4Sg1WcoId0TRP9m9a1PUccCukBCpKV
	Ha4lC7hwTUpfPWV8IwNYUII1UmV0oj46SQ==
X-Google-Smtp-Source: AGHT+IFo9PfoR2VFnkdMW6D+8DxOP1Z7IGYk8m3R72iDIYhs6kbEfE9r7ysKQXh/eTBB6QgxoFDLCQ==
X-Received: by 2002:a05:6808:17a3:b0:3a7:4987:d44 with SMTP id bg35-20020a05680817a300b003a749870d44mr13279960oib.20.1698131981078;
        Tue, 24 Oct 2023 00:19:41 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id p130-20020a815b88000000b0059b20231f1dsm3837971ywb.121.2023.10.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:19:40 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9ac31cb051so3950108276.3;
        Tue, 24 Oct 2023 00:19:40 -0700 (PDT)
X-Received: by 2002:a25:f812:0:b0:d9c:b566:242c with SMTP id
 u18-20020a25f812000000b00d9cb566242cmr11089305ybd.55.1698131980606; Tue, 24
 Oct 2023 00:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org> <169809755184.20306.3698252725424588550@noble.neil.brown.name>
In-Reply-To: <169809755184.20306.3698252725424588550@noble.neil.brown.name>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Oct 2023 09:19:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
Message-ID: <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: NeilBrown <neilb@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	ksummit@lists.linux.dev, outreachy@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Mon, Oct 23, 2023 at 11:46=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
> On Tue, 24 Oct 2023, Andrew Morton wrote:
> > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
> > > Yesterday someone on my lists just sent an email looking for kernel
> > > tasks.
> >
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
>
> Doesn't your email reader automatically hide most of a large quote?
> Mine does :-)

That's part of the problem: many people don't see anymore if the
previous email author removed irrelevant parts or not.  Until they
want to reply...

> > It's happening significantly more lately.  Possibly because the gmail
> > client helpfully hides quoted text.

When replying, the Gmail web interface (or Chrome?) is also very
slow when selecting very long irrelevant parts for deletion.  And it's
hard to predict when "Show original" and "b4 mbox && alpine -f"
would be faster...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


Return-Path: <ksummit+bounces-457-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A483D55E3
	for <lists@lfdr.de>; Mon, 26 Jul 2021 10:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F114C3E0EA0
	for <lists@lfdr.de>; Mon, 26 Jul 2021 08:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC8F2FB2;
	Mon, 26 Jul 2021 08:52:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B872
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 08:52:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1g3U-1l6Bce41Ki-011yT0 for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021
 10:52:16 +0200
Received: by mail-wr1-f42.google.com with SMTP id l4so10118844wrs.4
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 01:52:16 -0700 (PDT)
X-Gm-Message-State: AOAM533eNKn4WY3oVXVDM8Rb8qjuqa9jQAKSocQj1GCbZmLleHJ5H7M4
	uac5tywEQK0Z+a7KMbqOpEilTNSAlknr5ESn5f0=
X-Google-Smtp-Source: ABdhPJwsKxxjFjKW/PtMxFUw2n+9whg+Bw1cd3PP0rTqYWGN8WqTALjJ7dJFHbbWhYvNaQ7Oo63gNR6laHxr1HR0SVQ=
X-Received: by 2002:adf:e107:: with SMTP id t7mr17994330wrz.165.1627289536545;
 Mon, 26 Jul 2021 01:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com> <CAMuHMdX1Le1JLjOCGt_sB34Fdz_LJXsmKZJ4PUytaeJMU4vJCg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1Le1JLjOCGt_sB34Fdz_LJXsmKZJ4PUytaeJMU4vJCg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jul 2021 10:52:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3bA2D6FXHEOdqaOCm=++0DudZmuPnR+GJvWpF0LmZtDQ@mail.gmail.com>
Message-ID: <CAK8P3a3bA2D6FXHEOdqaOCm=++0DudZmuPnR+GJvWpF0LmZtDQ@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, NeilBrown <neilb@suse.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:iFmPUtR1vRxRxb9iBSabvHAwHXyu7fIycY7t+/qVarDZa1NgqRk
 16l3Fi6etBKPb+WoIdKFvmd5QS184RsR47G0prg9AvxhG2iCnrF1TLF+jGsn/ozTs0ms7d4
 QD3VY7JUCboVIpH9f2PP6P+EqcVzSHIeiVh2drVlwhULCgxA6rGeHivHOaUflpQpiPRwA7r
 eqby1f6CUGY01FwfM5isA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ql5Yf52j5BM=:LYquLZDZkKQJXGaYLaCfUB
 kdviCVny/oFxZ+wwOEZB55NAShBZ+mXZUbTfmceBX8kwpLd0uNVoglaS8qy5SJtgP1OqE3FG2
 w5wKbaMFfgpjUA/ScXrEQWQlt4PbtoahDlTkjYDeNHwyAnPjlVQRJk9cFbI6J83SV3hIqe3v4
 C7WG6BruYTJgsY74Dy1AAHXnowf42zo3VjBGqRI9Gggo83lwhNJS/5j3ZdzrCzTZW/EzZVMmF
 pUHaM7nvO/Du9hcB8PtAnw1rjKA/hIFUi2LQMIDAGolxlEcP+bdlzt9WOngdg5NOwv+dUXDSl
 66MUaQkDFsZND5mzMYGo7imIjt8v0CJ6ybh3A28rQq2i6UqnHZBxcVvoCJoZAY0yfArkNl9At
 iqvN+I978/yYDLetsQ4GYAmh3wI6GKjBGhDIP0RUpYF2zysFhu5VK5kaXSvcfMT5cSigvRAyv
 MRS5KrkLCHYc6Y6FVeN5PR0GCaB0x1NS8eeVp9yCHQphBSDul5K0ZKC/tHmTRFxoGiEfEyOR3
 w9+SHeuF21FMezQDgxtMke6KbIXJiYxmZ9e++LjAt18lHeyXgDw/UqtSMYvaQp/kXX7Ko8MV0
 7Q612X2rtM9HZiDEIiRvZraiSXls9ZZYwGhKElBplIaKM010eAseJQl18JCfhFXa7pKX3xvC8
 4o1yb9uUFLp+qjRx4hxit/Wiw0tPbWYQFGevFEF0G26wM4SibIxHxGs5OOB9BLKaVK0P5T1YV
 iGH8WRzZiKc6vN6rFqb5nDuoEHnwtMLnH4PzfEZSiFq5K1U41xnOHo+uCe6Y5g776Ofo8gzTl
 9y7GUzF0HVM6DB7Zx7QOrv7WCPWnWfPvcSd5J+TFvwKfwjYCsToyJWhR+bhZQJO4aaE6h5U04
 hfWDQayyHYAIv8BmkUGMP/O1+L+JKyehwH6j5I9lTvmhJo+bmDOurY/NQ+SjWupIBmKdCBeNd
 HqXKk6w7m2Nrn1JxLiHl5JEQExtnjZoMEANYbnrnfbuYXXcxL8KRW

On Mon, Jul 26, 2021 at 10:39 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jul 26, 2021 at 10:21 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > e) either a valid pointer, NULL, or an error pointer
> > >
> > > The last pattern is seen with the various *get*_optional() functions.
> >
> > I would always consider those the exact bug that I meant with "because
> > everyone gets those wrong". I think the idea of the "optional" functions is
> > that you have two implementations b) and d) and pick one of them
> > at compile time. To the caller this means either an error pointer or
> > success, but checking for NULL is a bug in the caller, while conditionally
> > returning NULL or ERR_PTR() would be a bug in the interface.
>
> e) is not for optional kernel features, but for optional hardware
> functionality.  So it is not known at compile time, but depends on
> e.g. the DTB.  See e.g. devm_clk_get_optional().

Ah right, I forgot we had those as well. However, I suppose no amount
of annotation is going to help with those, as far as the checker is concerned,
I would just leave this as not annotated. At least with the clk API,
the callers are not able to dereference the pointer because the definition
of 'struct clk' is private to drivers/clk/clk.c.

        Arnd


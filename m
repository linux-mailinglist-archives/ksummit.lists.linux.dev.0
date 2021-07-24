Return-Path: <ksummit+bounces-449-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C733D4814
	for <lists@lfdr.de>; Sat, 24 Jul 2021 16:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 787871C0592
	for <lists@lfdr.de>; Sat, 24 Jul 2021 14:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68B42FB6;
	Sat, 24 Jul 2021 14:08:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C0B173
	for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 14:08:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MgARS-1lR3I83jna-00hidp for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021
 16:08:54 +0200
Received: by mail-wr1-f47.google.com with SMTP id z7so5344167wrn.11
        for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 07:08:54 -0700 (PDT)
X-Gm-Message-State: AOAM532JYOosjn32f76RDURYluHC6pjM4AaSflBNRbmgjfkXRqPQ9Dlj
	+2wDCJJ+SRGCWs1fUFMrc/Ng5SjQs1pqXl7MdYA=
X-Google-Smtp-Source: ABdhPJyk9UH167EGmBlvYLcfUvK7o4Cs9ySlNun23iWai/yKxJ+Q+uyVCbnTjnMj29uBGnED1lI6NJrUK5cLo4sCMU4=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr10508588wrw.105.1627135734496;
 Sat, 24 Jul 2021 07:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
In-Reply-To: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 24 Jul 2021 16:08:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2K0cj-k0MHkZGeLD6UnbqWvH4nL_0eK5LGXw1ErfT2EQ@mail.gmail.com>
Message-ID: <CAK8P3a2K0cj-k0MHkZGeLD6UnbqWvH4nL_0eK5LGXw1ErfT2EQ@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:he4bjyGVQgiRfAhUQUeVrAhr0dxzylZRSWglqoIrRZWYfnzUBy6
 HyLapzu55fZnJahcoWr4C31niKVn+pBzXO5Ayd/YdTgcMSGELJXqNqZXA8AGU0Z3KufbyMz
 MsWbYXvzs7jYTIVbnRAh+fgUX7V1k4vuA7mM0sToZKmyRWnYo3vE7Ltz4Kmw96foZt9mPOH
 CbKVuwhoEXQptdIreHavQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yVWSSSijcvM=:4MCaxZeWFP+qr10gC7CUNn
 i8S7EAN/OGkMTLUoVLT8lP/oshqYfs2NW42G+1j+5h0fnq9r9N1y666HNgtW4/k2yeOnMnm96
 0fMcr6s/Te7DZJQ4msS1NTmNyzrMfIDWrm7jVhR/DYthC/xBdP/OnzKin/o8lMLNAGGnXJsmS
 TEaw6DhvgS1YN4QTFJSWiKO6NcbFPOtORdFXYQsmPOU/e0ngXC7Y7Iur8ojZbIrX3RJRwGcxf
 ZiSk9D2Y65DbjD+nfuOzfJUxL3sT0fBpDZK7gXqfmBiyh61zHi3UVKyWRVw1wjGP4U7Uyyx7T
 gTbsLgVxDQg+sBZXAoVmtNOT5LHOXYSArtVFujHczWLXGwHEv5PkzxddcnB1hfKUQYT5CsEmo
 UfnYTe/sJJFvN2qN15tvuRwGaKl9YhWMmh4M9/xLIDhf+JCV4kkKom+FQ/V8LTkBIa4Fs8xFo
 ZQCCg2OBNGYtvmqK9g4IEaPwlPrUlHHuT/MVglp+DC0izphx5cyhPJqzPdbfPeeZEk1p+FaKw
 tgxUrMoXaeCUFO0BpcOFO7aLkcF/IF0NuBXK2LUj1FxJud2rBYrL5vIAeiB5A67gffbC4zMGI
 sd9lkN9jsCBphdsnGCXqtyPw9td+K43zHqcJc8V6y4tZJQhiQGZpGapAEro6afygumlhl8dE3
 41nb8lwvCMvDBV/UeDbrhWNymob4480yqgnMaxzLPLnuuLc8Kb1BqG3uUjreVrosJkmUwvjH5
 rqakzQW6aA1Q7iQSjbVwR8N53sh1C77hr7XKZGXBSkPqJ9PbySzc5iC7Neleu8dMtWs26qZ6r
 bE18lA0giEInUXhw+LKdx00l7EYZ0tuPpaOWdNjG0E8guub/Gyp1uuqfbQshURp3IM+qvaH

On Sat, Jul 24, 2021 at 3:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Dan,
>
> On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > These days we have disabled GCC's uninitialized warnings so it falls
> > to static analysis devs to review all the new warnings.  I sometimes
> > ignore warnings if they look like probably they aren't a bug.  Does this
> > function allow zero size writes?  Does this switch statement really need
> > a default case?  Maybe sometimes I miss bugs.
>
> Yeah, I tended to find a few real bugs every release using the good old
> gcc 4.2, before support for it was dropped.
> I hope someone still runs modern compilers with GCC's uninitialized
> warnings enabled again?

Unfortunately, the new inlining in gcc-10 and up has made the
Wmaybe-uninitialized option pretty much unusable, especially since
all the uninitialized_var() annotations are gone. I tried for a while to
keep that running on my randconfig build machine, but the number of
warnings that got added was overwhelming after a while.

This does contain a number of real bugs, and at least clang and
smatch can both catch a notable subset of those, but it would be
good to have a replacement that warns developers about not
adding uninitialized variable uses in the first place.

    Arnd


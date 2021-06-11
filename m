Return-Path: <ksummit+bounces-195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103E3A40C7
	for <lists@lfdr.de>; Fri, 11 Jun 2021 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id F02F61C05CD
	for <lists@lfdr.de>; Fri, 11 Jun 2021 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D41D2FBF;
	Fri, 11 Jun 2021 11:05:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B84670
	for <ksummit@lists.linux.dev>; Fri, 11 Jun 2021 11:05:22 +0000 (UTC)
Received: from [192.168.1.155] ([95.115.52.72]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPosX-1ldaEj40EF-00Mtt2; Fri, 11 Jun 2021 12:58:51 +0200
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>,
 Christoph Lameter <cl@gentwo.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <e993d6c84c79d083ecfe5a8c8edabef9e9caa3ce.camel@HansenPartnership.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6d8299e4-2707-7edf-ebe4-f5ca7b7ee8ca@metux.net>
Date: Fri, 11 Jun 2021 12:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e993d6c84c79d083ecfe5a8c8edabef9e9caa3ce.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W1CuRBv9b9vfO/cntxLvE7zRNUCd1/dUgLqWvl6KCwi7Sw23ByG
 lxCAe9Q91/0vR2PyBETRIzab+l26EBWvYSHZ0LUnS9cubvCX5xzUC+CV5JjFwPCWXQxaQOo
 5taiouS8C+FKLJ+dmpW4iHuaNuDY6rfJXKdICti+cmqPwkBEzGu+ypcMKrurkTnsQ34K6rI
 06GNiokz08qz4bFDbl2SA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/sSkcGO1Nv4=:RiSFR16wMxL0kKQLUOVYgY
 mXMHqfP1D2aaKlrKeXknRPYC4+Mfm4V57ipwkdBU4cxbAdUaoT/FDkGrNAvDXaOqalgMIAcOG
 ETa6zdDLotrI3UNByrpgjxH0sF4vb3hKkcpmrXTRPxnPAPAp5OUTy6t+//NVpORoST/sbaRLv
 8CP1bwqsN124KLSu+EXM3eGT8yYFR/aiwxgn0EhRbNoQZKY0vc1VWD0WP43mPH3cCSv/XZDFz
 5kxzK6L3WGYMSjtXLrruoxtyWG2AbdFZyZgxLlB2Y+8h4KI+aW7CjmzoaHEgUAa/Gi8Pqv6ZP
 5XkncvB8Co2UXXKscYFaqkCs0PnkOsnghlk5EnX/HG4DBrkmaQp/RNXOvb/XTsp1HMNm/78Hi
 usPyhiz/Bq7HPA5ovdEQQsYbBJr8+lTcB7e4iss3aUmsOKeb7AYlqxMTH9Nuw4GMk2AJeLrh7
 266FrgLa7H0VMlkhLUdfyPwFIwVoRzDGDDEVttSmRRcwPKN7dgePi849aLI8gANExd8UuSO7Y
 HxJzhJvuI7XIEm2fuRP4JA=

On 09.06.21 21:23, James Bottomley wrote:

> but the US is definitely moving
> to a regime that says once you're vaccinated it's pretty much over for

As far as I see (watching from the other side of the globe), for most
states it already is over, no matter whether somebody got a shot or not.
(actually, getting reports of people *with* the shot get increasing
trouble, eg. kept out of stores, schools, planes, ...).

FL and TX seem to be the most relaxed states in this regard.
Maybe ask DeStantis and Abbot whether they'd support such a conference
in their states, maybe they'd even open their cheque books ;-)

> you and I don't see a problem with taking advantage of that for hybrid
> style events.  However, even with the best will in the world, I can't
> see much of a way around the problem that remote people at hybrid
> events will always be at a disadvantage ... suggestions for improving
> this are always welcome.

Looking from a totally different angle, I believe the hybrid approach
could even be a benefit. For example, longer talks - IMHO - are easier
to do (and for the audience) when just recorded, so people can listen to
them any time (and as often one wants to). Spontanous questions right
after, I guess, are only helpful for a small minority that's already 
deep in that particular topic - in those cases I'd prefer a more 
personal conversation. Another scenario are expert working groups, where
people already involved into certain topic talk closely - IMHO something
where direct (group) calls are a good medium, and probably working
better outside the strict time frames of such an event.

Maybe it's good idea to jump back to square one and ask the question,
what people actually expect from and try to achieve from such an event,
before going into some actual planning. (I could only express my very
personal view, but that's probably far from being representative)


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287


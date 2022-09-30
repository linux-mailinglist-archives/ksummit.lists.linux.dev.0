Return-Path: <ksummit+bounces-803-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A85F0712
	for <lists@lfdr.de>; Fri, 30 Sep 2022 11:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27391C20995
	for <lists@lfdr.de>; Fri, 30 Sep 2022 09:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D62B1FBE;
	Fri, 30 Sep 2022 09:03:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D01FA7;
	Fri, 30 Sep 2022 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664528621;
	bh=8v9fTyRfVJtp6wYfaSBYK/XBoyNOZx27isvqUhFB7H8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i5Pu4ktLveHonqTkgCFuXvioLu9iMl0WNCV80xhBnU46kvHPcpaf2KArjLv4wKQ0L
	 g5PLtXb9iK9b6yANozPe2stlcstZy3XjwwWNRnnDJysoMI/u3aG+EmksjkHvUdtZFg
	 4Ow/s96/s8Mh5e4CFsfiN9Ea86XIYI9iFiUEQzyE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.5.110.31] ([143.244.37.65]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MTRMi-1oo8au3L92-00Tn5v; Fri, 30
 Sep 2022 11:03:41 +0200
Message-ID: <52d93e6c-c6f0-81dd-07ca-cdae13dffba4@gmx.com>
Date: Fri, 30 Sep 2022 09:03:39 +0000
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <5d15ec50-e0b7-dc90-9060-3583633070e8@leemhuis.info>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <5d15ec50-e0b7-dc90-9060-3583633070e8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XpYRSRlK2nukgeIwfRIUZ5gbqDV+aeVYnVeNb/F+TdrC3i6pGcn
 ijsg7Ck0dA+jRTR05OHW5LUM0CbXgrUN56fL9YIiv9yQRbGovdwKW1prKzqpg/EiIIOZlqw
 SAzAWPjDXVchZ0ynFXL/dzZhIker+QCPFPqcdiRuRsZgsGdsdAHGyh6w22oh2pKyW+mLf8F
 J8HZxasNMxW5M8XvQOsgQ==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:gfdoIYXk0Wo=:Pfzrcs+zbBtKL7wbqYv9B0TV
 5FAVIP1WmVYKOqlstFu2ZPhzJreLyolhQDwnIWwfa48WF5VL/Fa4YcwsvZyXxpS0FLdqYT3vt
 63sBk5fi261DxCi14HfQkzNKIZWcY8z39zkhta4AdPmbbObDWu0oitUOzyqVRaI5L641+napJ
 T/gq/xs1HQhCDRCDzRBv/A1j00VQ2PdfypwRfkAA09iKjRL4j3Qo5wTpMvu8x8PUfJnQCe2OG
 YFbJW7ybGjH1efibOhRyPHDQXL3eQz8LAOtOeB/rtv5BjGkRW9lbzuSBqaUcCLuwAN8cZrZh1
 pBK149D76R4htJaaIWvIZYaYGDm/HZZnTxZLsJP3BLAXM0pGEDQBioiLprgVoHy92vYjI9y7J
 xUhMrYyqYZ27CKLbpvJogOATlQCE89op0IwP0etJrS1zrn+pN2vZy25u1Alw4TDoK0VNAzyjF
 yVFwuMgX/kVAJD3ziYgMgGYnCcCRvREU6Rc+CmqpJLg+rHLRRPY/QUUA+8iesfJwN7sm9SviB
 9zwo+bllzESsTZsxZz8lloKmNcVF9FP7d5ZznLL2cRI8Ulli/xQYHShMwsNdqVdllZg2w3Sxh
 chEtgQbFVDZ2IWfg0sH0usWJ7n9ao8UG/BhjEdYrSsmkFPUsgKN3USK47oXlogsaICLr/Zq36
 plzPiavsF/WIll9irCIf3AXYGC7FzKGe7/6lKXQzfAdVCq8dOCRI3cC+TdEeWFKUUz3J9lOrp
 88docLcNcfaRSyN6DyryDtnzgTngpT7maDVWC3W0IL+08Y3TJIwDGD2LIz7KFDp+Edz9zIhDY
 MOlouTuimFjWZ3RalrNFD3SDFZjQmtCEXm84hIlpOtmmvoSzx74X7XB+nPHKxteByg2q5/M1i
 r9G1rLbROTiuLLaQUR6wYXZcIv/S8Ng2sQDAJ1dgQj4yOOvGZnJrMOg6K/oIuPIXBskAWltNB
 +muY6bvjMGv7VZ4dcuB0cgtsQ5XtVR/Z0W946QeaS7vPlbGNt1lAEPCTrsrx+NmwNpxl++cDG
 LaHe+tHFzYyWKafsba9yrSYJssrJvzyhv5ngfTWpZR+cRjHwjYUjnfGAwKzG6obyAlYJa/ycW
 7+v56p/FR9zEo6gDxccgBlcV2qd3ueBnNqqavrno/IsmULMlN1gDcef64Ea6ujYkuhcpDWoxh
 M4ApiOPDmWBitIlONCmeDJKU1LiiTRxc24QDcsM715LeQA==



On 9/30/22 08:47, Thorsten Leemhuis wrote:
> On 29.09.22 15:04, Konstantin Ryabitsev wrote:
>> On Thu, Sep 29, 2022 at 12:22:35PM +0000, Artem S. Tashkinov wrote:
>> [...]
>> We do have ability to fund development efforts -- LF has been the prima=
ry
>> sponsor behind public-inbox.org over the past 3 years. However, there m=
ust be
>> a clear, strong, and well-articulated mandate from the community. From =
what I
>> heard, the vast majority of maintainers simply want a web form that wou=
ld
>> allow someone to:
>>
>> 1. clearly state what kernel version they are using
>> 2. clearly describe what they were trying to do
>> 3. explain what they expected vs. what they got
>> 4. attach any files
>> 5. give this bug report a unique identifier
>
> Sometimes there are days where I think "let's go down the 'do everything
> by mail' rabbit hole some more and couple a pastebin and a somewhat
> improved regzbot with an app (usable both locally and on the web) that
> helps users preparing a report they can then send with their usual
> mailer". And then there are days "ohh, no, that might be a totally
> stupid thing to do". :-/

Emails are absolutely horrible in terms of keeping track of the state of
the issue. Who has replied? Who has provided the necessary data? Where
can this data be found? What if a person has forgotten to "Reply All"
and instead clicked "Reply"? Hell, no. Then people get swamped with
their own emails, the previous email from this discussion went straight
to SPAM for my email provider. It's too easy to lose track of everything.

The kernel bugzilla has helped resolve critical issues and add
impressive features with dozens of people collaborating. This is nearly
impossible to carry out using email except for dedicated developers
working on something.

In the LKML and other Open Source mailing lists I've seen a ton of RFC
patches with no follow up. Even core developers themselves aren't
particularly enjoying the format. And those patches often perish and
work goes to waste.

>
>> Then a designated person would look through the bug report and either:
>>
>> a. quick-close it (with the usual "talk to your distro" or "don't use a
>>     tainted kernel" etc)
>
> I think having some app would be good here, as it could help gathering
> everything and catch problems early, to prevent users from spending a
> lot of time on preparing a report that will be ignored.
>
>> b. identify the responsible maintainers and notify them
>>
>> The hard part is not technical -- the hard part is that "designated per=
son."
>
> +1
>
>> Being a bugmaster is a thankless job that leads to burnout, regardless =
of how
>> well you are paid. Everyone is constantly irate at you from both ends [=
...]
>
> Tell me about it. Nevertheless I sometimes wonder if I should give it a
> try once I got all this regression tracking thing established somewhat
> more, as in the end there I'm kind of a bugmaster for regressions alread=
y...
>
>> Before we try to fix/replace bugzilla,
>
> Just to be sure: I assume you meant "replacing bugzilla or fixing it for
> real" here, and not my band-aid efforts outlined at the start of this
> thread? Or do you have a problem with what I proposed to at least make
> things less bad for now?
>
>> we really need to figure out the entire
>> process and pinpoint who is going to be the one in charge of bug report=
s. If
>> you think that LF should establish a fund for a position like that, the=
n you
>> should probably approach LF fellows (Greg KH, Shuah Khan), who can then=
 talk
>> to LF management. The IT team will be happy to support you with the too=
ling,
>> but tooling should come second to that -- otherwise we'll just be repla=
cing an
>> old and rusty dumpster on fire with a new and shiny dumpster on fire.

Bugzilla with all its issues is still super convenient.


Return-Path: <ksummit+bounces-920-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169935F42E7
	for <lists@lfdr.de>; Tue,  4 Oct 2022 14:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CC6280AB7
	for <lists@lfdr.de>; Tue,  4 Oct 2022 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B1933EA;
	Tue,  4 Oct 2022 12:25:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCB33C1;
	Tue,  4 Oct 2022 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664886332;
	bh=qgZLLV2aHolUAywGvI48mu/krYEdR9x8qhwAEtcjS30=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Yr1N3GCEyxE01B9mikDVxPP+ehztXMVFiyQjzKMMNwFLfQh634cgAZAinMyEPztFm
	 3kj4EMLj7vJqMjUJF6mG2MMiKrr/tHF8VsRJezxt9URDMoCbgdpbhHOpLdCMlOUstc
	 Ll3iDZS8rJ0YDC+PFQnBavDIEO2JC8k9+aVj1VA8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.17.110.14] ([143.244.37.77]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MMobU-1owFw00BL2-00Ioog; Tue, 04
 Oct 2022 14:25:32 +0200
Message-ID: <b23586ae-3082-08dc-7bc7-94c3fecffbf9@gmx.com>
Date: Tue, 4 Oct 2022 12:24:23 +0000
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Steven Rostedt <rostedt@goodmis.org>,
 Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com> <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com> <YzqjfU66alRlGk5y@kernel.org>
 <20221003153718.o7fhrain5fnwwu3l@meerkat.local>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <20221003153718.o7fhrain5fnwwu3l@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FFItU/whtuMQMf/VRXiFBX+iDYB40ULkQsUsptF9dFHoDW28zZr
 RqLq305Bxwqr49UymOCCiwHmGqyt26l0JxxLXwxhs9a2enOkImn104sdQxJNFyz4AM6mzHK
 KvHxqMvezQUZRd/7z/WBQwzWu3cuaA3Ap5vx1haHCjpT+xSJvAdG6qj6FUCbK+2oPYFr7jF
 JuuIW65C/juKq5542ALkA==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:57+dta1fYB0=:6PreiOUc6q1/usH2KkjpXfSl
 LUVpqupnzJshXhr3Qav9S/ZKDCwYTwytjscdskLB5z/apwRh6Qe/8eZi294dGGofnbi0TQfqi
 TNRY8thL8kD0mKErr23ccDngLJRzBId9cK1VYYw3gn52LqnuPMORwHvHPDm52iTFMDRY6dCBb
 TLKzNGjIqJHFxsJkSOlh0sdQbPEqRnW0ALbAhe32McTw16feNeLEaBmFS5DGE5nZWq7XZHMYc
 GVr5VDwYuinaCLKAwxm0P3sJJd/urByAl0o6nTQiU1PECVz3VAGrhIA+O6vWM5Wimj7do6Oqe
 Z2L4NpoId7IbjNCbSL9u+EAL/PH4Ok8Uz9k+D/75l3UJh11BDoMfsaaX3HCdV2Te4GqIfYV58
 Az00chyh/q5Whv5CeerMcyy0ws1LExjba3c0d4FN7lwOgQFG3nWpafps4F39WcORGoWPurr/7
 qXycVOVxYHgIakw9dr/eeGgb3jnGEhqNvPm/kQTunVQ27a3k00n4lk1cl6QhivVdTpD2Sv5iH
 NdrUmtAfDjQAUxtyganmyp8deqIcRLO64qkZz0GqpExkQoBT21oNyw/YeWfvYbwmiYXwgLlXe
 FDjffVKCafWR/Jk2AcbBm9pYFJKLFN46cta2DYOvcINd7bQIEe5r4xflgBJOKfC8EOdFxmsYS
 dAVI/Tq4xbUPXYVYd5yBPZeOhUOB4w0gg0i37D9joGQWSFVt0ZB+Qy/KDg56WLKgOCpgodmSs
 uuAvN0PuG1Xrcu3MqxMfOMsEXujWKPN27FsCJoS5C3rElkO61MHncRLhJUNyp5/f4dC5vYF/z
 tpSisFP8Cd7NtE9FU7ixXt2SaMgZKUJNNSgKpoahYWnDVmFY/paBOTvFZLSiPQtaPCnLBPNke
 Sc+lzlbiuKBTnFnoMfmt4QDrSDtOnVgHoDRAIvMDdyy6kK3UhXqdV44mlNDekozMnuXEsIfp8
 khdyFI/wxGh0mZ2XkqEYCM75/Wqx6l8BbHWD065QeKAWg2RYMkcG0aklmUIcrIfDunl70GJEP
 jp+Btb/d1H3IUOCWlYybiuS3eOaCUN9T2xXu4Vsp9zlkm2rLyaQAYWVdYE3nIEL/oHPtkTC4M
 k2q6rIIiT62TfsdfT3qwH5WV99KTpTABgrfHdAHGT+gpTPZQL9AaoPx5A8OB4G6VxmXTRXEbz
 rvyx5yV0KP3Fgf+lnOaFgiI1oBYZaX46ZQj1GgI5Oc+KuA==



On 10/3/22 15:37, Konstantin Ryabitsev wrote:
> On Mon, Oct 03, 2022 at 11:55:25AM +0300, Mike Rapoport wrote:
>> If I'm not mistaken, bugzilla lets CC people explicitly. How the databa=
se
>> of emails in bugzilla would help choosing the right people to CC better
>> than MAINTAINERS?
>
> It can't, actually, which is I think is the crux of misunderstanding her=
e. I
> think what Artem is proposing is to *auto-create bugzilla accounts* for =
anyone
> who shows up in MAINTAINERS, so that they can be cc'd on a bug report.
> However, everyone understood this as "add these people as default assign=
ees,"
> which is not the case.
>
> If we auto-create accounts for MAINTAINERS, that would allow them to be =
cc'd
> by an actual human being triaging bugs, but won't lead to any discernabl=
e
> increase of bugzilla mail.
>
> Artem, please correct me if I'm wrong.

Exactly. Only maintainers and mailing lists will be assigned
automatically as it is _now_. Other developers need to be CC'ed _manually_=
.

There's no SPAM issue or never has been about what I proposed. Absolute
most people will never CC anyone 'cause bug reporters are normally quite
lazy or not experienced enough to grep git logs.

You're absolutely right.

Best regards,
Artem


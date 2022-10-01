Return-Path: <ksummit+bounces-824-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 411BC5F1BF9
	for <lists@lfdr.de>; Sat,  1 Oct 2022 13:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741E4280AB4
	for <lists@lfdr.de>; Sat,  1 Oct 2022 11:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F03A2593;
	Sat,  1 Oct 2022 11:21:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4F2569;
	Sat,  1 Oct 2022 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664623270;
	bh=HAla/Vs9GZG3HSB3GcXNkxnIDhYaym/q+ezmwjQc0kw=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KQOMUf8A5Zc3bXGQLqxJkdzC6qpXK3MKJM/d7H/4i9h4nqiw4nqxW9ChGD2/3L885
	 wuMKKd9rblj/Y1mmNgHGR3QVu6UU3hZwrURbF3KDfhW6c8pSWWBHy6sND7I2WgdVoS
	 +RLHBJEPNRsM4ykJBopspoIdmC1nBFfYY67LaxNM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.30.110.10] ([143.244.37.31]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MdNcG-1pDvIz3oqu-00ZOOX; Sat, 01
 Oct 2022 13:21:10 +0200
Message-ID: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
Date: Sat, 1 Oct 2022 11:21:08 +0000
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
 Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lND4xANQJhj5evny/d1QBRvz1T0JPVUoxd55j9BYZcK2yYDyBBr
 invuQRGlZVElWeeILhE5JYOKoU0Ikq8mij4NPxdyOzwtE45E1ydxrTiG8ZZfyEhfZL7mefP
 nqZZLJcIE+zJLmxQ2gl/puBEC1dcqQd+VVEKVF4DppXyCVMSa115fcHl4Xyo1DvgwgnSGfD
 VKERjmUIfkk4tCdzktxMw==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:Keb35RhUD5Y=:2pA8L3tc49uSUp3JjEiKgHMM
 g+Rom7PktykwCoBMZ+ABwfbiPGY4JZwPy8tZ0C5u2yRnAxEJtPVYuQPxbIS7zZVTLVfzYwOOb
 as3iTm7HVc5zXkizFfsB972OtF8PRUVqB7cPdJDFAtHFBfP3c2CEDxb7uJoY1+1RqloBIYdoi
 AfbW1PzlDd9oKiVUmQfHqsQaXpm1CCTOOZMCw0luKJvNCtnW836Vd4O1OUq3CGM+hTSytCpjE
 7WKYalNrKPeMGUMXyo0UXSl/dGrILqLUOBJU/ffRHUkQ3m9OFu7kYiqFrEObWgl6X1SF7JQs0
 KNX2QKjv78KySlFNLWZkPZJ7xGILG8AswDhcM5F9KNw1wNj9ogWQSZc7W5D1OXMWG55v1Cg2c
 lFBaEIQaurMooDw3j/vjPCC6SdTHm+BVJJvIDjxgGPLwVhD68v3CAs+Nqx7zNhfXNYDIStr0K
 +I96nIK5fy7YFp26/LgQL3nl7zj6KqK9SmTZ3Rru7burpKgoTvtLXrvU7xA1tCgC9RW8Sg8XA
 wwG3soUBjE9dV8in96W3ClGpqUL38o/kBXLz2dKGF3cuUKDSOwZI0gUz17rMphLfg4WuB0nbw
 2oViDKz7E+7Js1+AaxIFmHM/Mu+Za3NoHwV3bXJpkAMSNNmAaMuPTe/s8uGTJdR5/RYW5Btoo
 v1o5MM4j6NLv5ynjULEKylBDzEc1cNqgWc62y8+B+pbd3SlPCgKgoZUM3Noa+ncgzjLbEatd0
 kkIGfvv+zRRI/gU6DmXzbIMmAk91X3SZwkXTgNbiOzIRNmHo4a6sp2bmcN7+FeBKkbrK0QSIO
 9Kcht9UUqn7lJLDMizY2zMfuS67SwagYSUWuFYfkerBQE3S4YO3mXXbw6fUtM/tI49X77/9LJ
 OdvKQcivMtYyfDWsOG1gvmO/TtoCu9x0QPk3jSnw81IwDNqjfqnye7HXwRewx7OnVzq4OpClr
 geWKs3/oFo4Gpr8kUDgZHRxyTni+/7s8GuYZC4PxP6ptXtbTbzqa+moBfm4tX0zi/w3n+/6lv
 Ldc7EsrgT2Wx1dNhmY9LyYRp8tiug6FiLqcQ0kmTZeDfOr0qru7LxvpWfj05N9im3Od6vxnYy
 a0EF4sC18EWPZzwCdnLN4Hq6Jss1VAQuvLnMZTV/auDvmSFsBo9ZxbvMmUX7OU6dAX83Nylhz
 vIY7tTmVdNE419UztTtWy9clebP3ADaajsanMpi/BJcw9g==



On 10/1/22 10:57, Thorsten Leemhuis wrote:
> On 01.10.22 12:47, Artem S. Tashkinov wrote:
>> On 10/1/22 10:39, Greg KH wrote:
>>> On Sat, Oct 01, 2022 at 10:30:22AM +0000, Artem S. Tashkinov wrote:
>
>>>> I have a 20+ years experience in IT and some kernel issues are just
>>>> baffling in terms of trying to understand what to do about them.
>>>>
>>>> Here's an example: https://bugzilla.kernel.org/show_bug.cgi?id=3D2162=
74
>>>>
>>>> What should I do about that? Who's responsible for this? Who should I
>>>> CC?
>>>
>>> Input subsystem.
>>
>> It's great you've replied immediately, what about hundreds or even
>> thousands of other bug reports where people have no clue who has to be
>> CC'ed?
>
> Quoting from https://docs.kernel.org/admin-guide/reporting-issues.html:
>
> "[...] try your best guess which kernel part might be causing the issue.
> Check the MAINTAINERS file [...] In case tricks like these don=E2=80=99t=
 bring
> you any further, try to search the internet on how to narrow down the
> driver or subsystem in question. And if you are unsure which it is: just
> try your best guess, somebody will help you if you guessed poorly. [...]=
"
>
> HTH, Ciao, Thorsten

Absolute most people:

* Will never read this document
* Will not be able to "search the internet on how to narrow down the
driver or subsystem in question"

Lastly "unsure which it is: just try your best guess, somebody will help
you if you guessed poorly", so send a message to LKML and hope someone
will reply? This generally does not work. LKML is such a high volume
mailing list, individual messages get lost right away.

Regards,
Artem


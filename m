Return-Path: <ksummit+bounces-919-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C474D5F42DD
	for <lists@lfdr.de>; Tue,  4 Oct 2022 14:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9492280A9A
	for <lists@lfdr.de>; Tue,  4 Oct 2022 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA6B33EA;
	Tue,  4 Oct 2022 12:21:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A8833C1;
	Tue,  4 Oct 2022 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664886095;
	bh=MPzH+NitWg19hGsyMW4Um1kZpkM80tSd2o2crCp46E0=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gub6kYpWk0pcM+CDv9eUFGTW3AeCQwWFbW95Q0WnTFqkCYLnUMGFRAdnQGGjWIIaO
	 1WvTaMJQ67yb3FXZPniQsZxzjS5Eee1oak2qLUWCBty24zjwj6GZG7axKV8Wqg5bGY
	 rC/KxEHfX7oZc1uzW0ROHlNXPbcnrU1BsOoUxQnQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.17.110.14] ([143.244.37.77]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MgNh1-1p8AvB3IMR-00htz6; Tue, 04
 Oct 2022 14:21:34 +0200
Message-ID: <80457c88-7344-e362-9873-8460f0b75c19@gmx.com>
Date: Tue, 4 Oct 2022 12:21:32 +0000
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>, Greg KH
 <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com> <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com> <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
 <20221003142240.hu5gj7fms5wdoujk@meerkat.local>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <20221003142240.hu5gj7fms5wdoujk@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:azUmYwr4mRCQksXJr3EndHWs2cFndxjbMqOKYw0ZKGeOa9cB42+
 sETMQPj5RQ8heJMEsXQGQXyxqQjTOvkfaPpwJzlLpzCGj0bRn1Yly+XmJSBFwoxfMNIai3d
 cNgfzbk+wzbpcXYPHfSoh4mQR+VcRvIoYoDUabHkWVbzubnSkRKFLHU6BTEF9NW4SocIu+X
 UKKrSB1G1sGO4ABQPm7Ng==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:PHJojMtTAnw=:LTTZe1rYJQV6+tWLL5AfBuaK
 H88OsaxAP84zZvMgjil533T7KRNh1m0n5DFPUjWbTxtfLKrvv+Wz9FE8ztN+WxHMmZ7WSH4m6
 YY6ERh35q7G2ytcrzZJ2TwtNP22XXKII4I6NsPvy3Rg0IwEzRVp92fGRYwHKJk4eU8UpRLYYR
 yr1NTqZO58SKf6isf95lrkybrTIS4traVooVuQ12zcJUqlHyXgVRw6FdgKCPaXvfVYAqNO8WG
 EoXxm0ZRJU5gY135M4AV+xlkU3pJh4JwL0rHPlru+d+HqBaOp5SFVnlsytnQqtml+uLvmG4CT
 hl/RH9c1eaWD/U6pJOQAxyjbskRoa64LBOCmwsckacqMYr+o6FHsSmKepSgRyMXmVKHVckOmI
 H/LLYFXgCJXDJU4gS3P4u7vA/mFP/u/lxz96NTqFtyq2wg1a1MKGAEnNbG6HxbDPSgdDQ5dAR
 WSORKpmbRP/umU2IG3xKaTYrko+DizAwq3MLpKxHyoAp/gVM7qlw0oTxhPvbD2M1xUMuyMyuW
 y18IaYskxWqnSB/Vy676YvTf9KfWZFSWalGx2n/iQGRMwFVm+qxBQXskTFI6eiAWPzVYeGEh3
 3QtfP6i4MIeMb5q56jRWJfvVWFxkEfBUlcLZT3vs6rhJefIGZj0aY7KTIbsLFRYld1DeWsoQu
 /Pr/is629SqTu6SlCvWjGmMRDnU1XO/bP+0hhRyW1FErq3n1FhQCVdl+Im69PnRZd/soUsrBH
 Td4iFkvMs+9efg0YF/bkxmRYWE4RftWZMEHmC/yRnaenVyqOvji4shi5aSkR7b6FVMoh2bbsz
 F45mh9klxTGjpNfCS89bz7zDSIYkNO2RSEKhxgS8V+YylSMShYWaMhACswxX+OVr8OiMgV+kR
 XgiKv+3HJQq7ucAniiSr/zqE83ipbnPFGtwZDYy8Ml8lsF/akutmzUPTa5GcfX+ktDkD4U7RB
 RJMbr3a4MyyNjJkvPqeiGzNPRexV6+tJqWxErwGZyRBDs0WSV+Lu+XK3G/05VGl/B/fxIbSh8
 WXLSU61oyscrTfdWoQyQCxVmF5ZakQ6LrpkF+KfaJk3L90d3Ne5Iv7teJHY6QogQ+EGNBAFLz
 LoJOCgaFQ7MNOSxRjusIkwBypyCF1iLWVSGbYS6C5PS+c2DYFusZR0slSXZ1QeyLJjFwSroNs
 Hty7kTbF60xpIE0WHrvKVGVQvtUWd0PMRc8CndN5Ypl7IQ==



On 10/3/22 14:22, Konstantin Ryabitsev wrote:
> On Mon, Oct 03, 2022 at 09:16:06AM +0000, Artem S. Tashkinov wrote:
>> The initial conversation started with the fact that Bugzilla is old,
>> semi-deprecated, requires MySQL [no idea what's bad about it, Bugzilla
>> can work with MariaDB and Percona as well]
>
> It can't, actually. It only works with MySQL 5.7 or an equally ancient M=
ariaDB.
> No, there is no official fix (because nobody is working on bugzilla).
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1592129
>

What do you think about Bugzilla Harmony? Works with MariaDB:

https://github.com/bugzilla/harmony

A continuation of Bugzilla.

Regards,
Artem




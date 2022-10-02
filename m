Return-Path: <ksummit+bounces-838-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC95F2359
	for <lists@lfdr.de>; Sun,  2 Oct 2022 15:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3564A1C2097C
	for <lists@lfdr.de>; Sun,  2 Oct 2022 13:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD52533E1;
	Sun,  2 Oct 2022 13:25:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6329B0;
	Sun,  2 Oct 2022 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TkwwomKWlqnBIYPS4/OnWkjJBdn/hEfUJ8NnLaO1wcE=; b=SJOuSpjJpptnqJCMproRy2Y/pQ
	XTBEoSvrtXwXQGmKBhF5icbvLvUOPRXYghdh/ZoBUVdErsQMCtbNZtNOi06upylUwUG5jvBDxnmEx
	MbOU9RpLNR6FBObjYe8TgYqox/x8pmIHvWHOvQ55Jb7SjiLvT3zHZihsr0O0xe0RCmWfVzB+xg2TY
	VOoQ4NYy4c9cyZeSpVYSvI3IxuypNjVTmgPMuyRCVtSkmA1j9l4yNrP8FT1fT1dXybXidvAafmqwK
	BWZKzmb5RwHNcku0QvHwLS78l5tFobFtzSWAkspqUP6MNZ9MAWu0xTiyq2g7ewCFLEXU798cPuDX4
	y6a0Eacg==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:56344 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1oeyxt-002dt6-1e;
	Sun, 02 Oct 2022 09:25:05 -0400
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <YzmBjgXq9geMnL1B@mit.edu>
Date: Sun, 2 Oct 2022 09:25:01 -0400
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <936650EA-E521-41FF-81C3-AEEB72E484B1@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
To: Theodore Ts'o <tytso@mit.edu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hello,

> On Oct 2, 2022, at 8:18 AM, Theodore Ts'o <tytso@mit.edu> wrote:
>=20
> On Sat, Oct 01, 2022 at 02:58:04PM +0000, Artem S. Tashkinov wrote:
>>=20
>> My expectations are actually quite low:
>>=20
>> * A central place to collect bugs (yeah, bugzilla)
>> * Proper up to date components (they don't change too often, so =
there's
>> not a lot of work to be done - you can refresh them probably every =
12-24
>> months and it's gonna be totally OK)
>> * An ability to CC the relevant people/mailing lists (this is the =
only
>> serious missing feature)
>>=20
>> That's it. It's a billion times better than random emails sent to =
random
>> mailing lists. Signing up once is easier that to keep track of whom =
and
>> where you've emailed or not. And of course it's a ton lot easier to =
find
>> the existing bug reports.
>=20
> First of all, some of the components do CC the relevant mailing lists
> automatically.  And this is the part of Bugzilla which is hand-hacked
> and has no, zero, nada support upstream.  I'll defer to Konstantin
> about how easy it is to keep that working.
>=20
> Secondly, not everyone is happy with getting an e-mail message sent to
> a mailing list that has a lot of bugzilla metadata associated with it,
> and depending on how they respond, the response might not make it back
> to bugzilla.

+1.=20

Personally, I prefer Bugzilla _over_ getting e-mail. But that=E2=80=99s =
just my opinion.

>> Bugzilla as it is works nearly perfectly. We have a number of =
developers
>> who don't want to touch it or get emails from it - it's their right.
>> However it would be madness to take it from users. That will make =
filing
>> and following up on bug reports an absolutely poor experience for
>> absolute most users.
>=20
> At the moment, developers aren't following up on the bug reports.
> There is some debate as to why.  Is it because users who can't figure
> out how to send e-mail, and who send web-form based e-mails send low
> quality bug reports that can't be easily responded to unless someone
> is paid $$$ and/or has the patience of a saint?  Is it because
> components aren't being gatewayed to mailing lists?

My hope is that we find a solution that *encourages* developers to =
follow-up on bug reports. So far, we=E2=80=99ve just gone back and forth =
on this and gotten nowhere.

>=20
> And if we force developers to get Bugzilla spam whether they want it
> not, and they said, "absolutely not", is it there right to have the
> mailing list gateway disabled --- and if so, what does that do to the
> user experience?  Thats basically the situation we have right now.

Yep, agreed.

-srw



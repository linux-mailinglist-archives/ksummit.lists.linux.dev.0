Return-Path: <ksummit+bounces-865-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5375F2557
	for <lists@lfdr.de>; Sun,  2 Oct 2022 22:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2971D280BD1
	for <lists@lfdr.de>; Sun,  2 Oct 2022 20:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17B43D78;
	Sun,  2 Oct 2022 20:52:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E533C00;
	Sun,  2 Oct 2022 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m2pYQ9C7TnBhR6GXwSdJWeWgO+q6zMw4LsWWrfUt0ks=; b=dbbmfrTu0ChGs4Vf6yBInIMkkl
	3HDXV7mlFiCjQueFv1i/T+LVPScahz38wCp3v1HJmyuXQQPr3V6uDcaJUBKUR1iVbUTi0ANMArVWZ
	3JiI4FhHkjdxC1kUlFl5CTha19YO9KTq1k7yJw1cwYhxUAEBOwoN4o3fQTtDfi6dzDEhchiwPVnvt
	HbAF95WUOxWXNfSDfAjhN/M5ankYf0Tqbablw8JjqQtEf/UFd7iVWNMx9qRIovki/1s/EM2FxZ8WB
	sJNux8BECfYds9tSINVT7LBlFxLE92M/F628pXHxg2kR6F3fMkXMy7UxbpIDbJqognUxazfMSaV+w
	rSVusR2Q==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:63584 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1of5wy-00AHqJ-A7;
	Sun, 02 Oct 2022 16:52:36 -0400
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
In-Reply-To: <4F80ED82-BBF1-498F-A093-82506B0EE309@sladewatkins.net>
Date: Sun, 2 Oct 2022 16:52:33 -0400
Cc: Steven Rostedt <rostedt@goodmis.org>,
 "Artem S. Tashkinov" <aros@gmx.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev,
 Mario Limonciello <mario.limonciello@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA4EA2D8-0EA0-41FF-B495-68EC9E92CC30@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <4F80ED82-BBF1-498F-A093-82506B0EE309@sladewatkins.net>
To: Slade Watkins <srw@sladewatkins.net>
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

Following up on something I said earlier:

> On Oct 2, 2022, at 4:41 PM, Slade Watkins <srw@sladewatkins.net> =
wrote:
>=20
> I=E2=80=99d be more than happy to step up =E2=80=94 new system or the =
current in-place bugzilla. (Believe me, triaging bug reports is actually =
something I enjoy.) It=E2=80=99d take some time to get adjusted and =
acquainted with dealing with reports, obviously, but I think I'd be able =
to take it on in addition to responsibilities in my personal life.=20

Honestly, despite my preferences towards Bugzilla (many years worth of =
bias), I think it should be ousted for something different. It seems it =
doesn=E2=80=99t really fit in many people=E2=80=99s workflows and seems =
like the consensus is it's just a hassle to deal with. And that=E2=80=99s =
fair!=20

To be clear: I=E2=80=99d still be willing to triage bugs/issues/whatever =
you want to call them (on Bugzilla or off). I=E2=80=99ll help where I =
can!

Thanks,
-srw



Return-Path: <ksummit+bounces-950-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8307453E8
	for <lists@lfdr.de>; Mon,  3 Jul 2023 04:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59429280C5F
	for <lists@lfdr.de>; Mon,  3 Jul 2023 02:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36662E;
	Mon,  3 Jul 2023 02:47:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CA375
	for <ksummit@lists.linux.dev>; Mon,  3 Jul 2023 02:47:06 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-102-5.bstnma.fios.verizon.net [173.48.102.5])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3632kpfZ014276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jul 2023 22:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1688352413; bh=HkiFOLF0e1P7v7WdaQLXaRGzHh+r4y4XaPN8KPoCK2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dXE04pB517gnOBSQap2kUnfYbsQG2sJgQCNloZ0e2Mz5I0obdZwv3RjICy+upuGmY
	 S/yVWQRyD9/6GNnhrLHu31Bz/FFw9SC3g+BDuqN+e5BX+kT/a4js9McAvjhHFVoNwQ
	 c1XgSZe7nQsyeasPKzR+CBbivdyyaHrD05xzOa2EP/aqHPJJqcXdtd0AMVhSHeRzsz
	 lQdsAYqzTZ/LOaB9z0ibhxP0mDR7m5fCwuYUUanT2lx/W8slDzZcWkNfcgBylU9et+
	 I+YdZLB4gE6bJddvVs2ZgEo5Xt13sANPREVgfGOVB7BCalflh/cDgPaoj2S5Y/0JpF
	 5HejZ50gBCqyg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 2291A15C027F; Sun,  2 Jul 2023 22:46:51 -0400 (EDT)
Date: Sun, 2 Jul 2023 22:46:51 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
Message-ID: <20230703024651.GE1178919@mit.edu>
References: <87fs6rxppz.fsf@meer.lwn.net>
 <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net>
 <20230701214603.6d0b299b@rorschach.local.home>
 <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
 <20230702143237.000a3330@gandalf.local.home>
 <CAHk-=wh+BDKMvm97wuqP6_09=oBrEGFkf=Cd_3+W66RvtWM1Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+BDKMvm97wuqP6_09=oBrEGFkf=Cd_3+W66RvtWM1Tw@mail.gmail.com>

On Sun, Jul 02, 2023 at 11:44:36AM -0700, Linus Torvalds wrote:
> For example, we have this "mkutf8data" program.  It can generate our
> utf8data.c file. Allegedly. Nobody ever does. You need the character
> database files to do it.

Well, Gabriel and I have both run it in the past.  The main issue is
that the character database files are (a) very large, so we didn't
want to check them into kernel tree, and (b) they get updated on
unicode.org once or twice a year, and most of the time there's no
*point* to update it.  Most of the time the Unicode changes are adding
some random Eomji's, or some script that either don't need case
folding, or would only be of interest of some ancient archeologist who
cares about ancient Sumarian (for example), or both.

Most of the time, the only thing we care about case-folding tables.
That's because most installations don't use the Unicode "strict" mode,
since (a) this would annoy Trekkies who want to use the unofficial
Klingon glyphs, which are not recognized by Unicode since they aren't
used by human languages, and (b) in strict mode we would need to take
every single Unicode update when someone wants to use some new emoji
or some new ancient script in filenames.

Cheers,

					- Ted


Return-Path: <ksummit+bounces-961-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DD778600
	for <lists@lfdr.de>; Fri, 11 Aug 2023 05:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E93CA281EF1
	for <lists@lfdr.de>; Fri, 11 Aug 2023 03:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15704EC5;
	Fri, 11 Aug 2023 03:29:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B1A47
	for <ksummit@lists.linux.dev>; Fri, 11 Aug 2023 03:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1691724591;
	bh=2fFRzDcVoC64hvTY3rRVdC3UJiSoDVgzVVYzNeqa/RE=;
	h=Message-ID:Subject:From:To:Date:From;
	b=aPT34zDfgYkeDyFI0QdSp9kCSSkDJHvIxD/eDkZe7VSa2kgolNaNHUnWjNucLV68U
	 wQkhMVaGcKQ8MMGxlqvxi6QQHg7A7MYoaNT52RbSHXuAyf/UYHjufogfWSEG4BdVlR
	 CDMeBYekHjFYmmb/DLO2RKwKpvG2YEo8IkYhuhm8=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id BD97112864AB;
	Thu, 10 Aug 2023 23:29:51 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id aCjionipzNzJ; Thu, 10 Aug 2023 23:29:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1691724591;
	bh=2fFRzDcVoC64hvTY3rRVdC3UJiSoDVgzVVYzNeqa/RE=;
	h=Message-ID:Subject:From:To:Date:From;
	b=aPT34zDfgYkeDyFI0QdSp9kCSSkDJHvIxD/eDkZe7VSa2kgolNaNHUnWjNucLV68U
	 wQkhMVaGcKQ8MMGxlqvxi6QQHg7A7MYoaNT52RbSHXuAyf/UYHjufogfWSEG4BdVlR
	 CDMeBYekHjFYmmb/DLO2RKwKpvG2YEo8IkYhuhm8=
Received: from [172.19.131.120] (unknown [216.250.210.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 54C1612865BD;
	Thu, 10 Aug 2023 23:29:47 -0400 (EDT)
Message-ID: <ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com>
Subject: [MAINTAINER SUMMIT] coping with stress as a maintainer
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: ksummit@lists.linux.dev
Date: Thu, 10 Aug 2023 22:29:37 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Stress has been a standard part of maintainer functions for a long time
now.  It comes from many source: internal deadline or porductivity
pressures, requirements to justify what you do from corporate bigwigs,
or simply the external flood of CVEs and syszbot reports that come in
so rapidly that you get two more before you've worked on the first one.
All of this contributes to maintainer burn out.  Some maintainers have
been at this longer than others and have developed effective (to then)
strategies for coping with both internal and external stress.  The
proposal isn't that we present one coherent solution but that the more
experienced maintainers relate coping and influence strategies that
have worked for them.   How do you cope with the bungee SVP who decides
that open source isn't revenue generating enough to be considered in
the corporate strategy and wants to proceed with the? or how do you
avoid being up all night dealing with sysbot reports in a part of your
code you know is never exercised.

The proposal isn't that we have one true presentation on this, but that
we listen to stories from Maintainers who've come up against these
situations and evolved coping strategies (which may or may not be
correct and which might not work for you but at least it shows how they
try).  Hopefully we can do a shared transfer of knowledge that doesn't
result in finding the one true strategy (which likely doesn't exist),
but which shows upcoming maintainers what we tried in the past, and
what did and didn't work and gives them more confidence to face the
challenges they will definitely run across as they build their external
statue.

The hardest part of facing most challenges like this is thinking you're
alone in doing it.  We definitely have the experience base to refute
that thought, so we should be deploying it.

James



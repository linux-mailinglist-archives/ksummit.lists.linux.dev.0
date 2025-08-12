Return-Path: <ksummit+bounces-2147-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3DB22EAB
	for <lists@lfdr.de>; Tue, 12 Aug 2025 19:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A3416FDF9
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3933F2F83D8;
	Tue, 12 Aug 2025 17:12:09 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E9286D61
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018728; cv=none; b=uZJkqHFSsYjb2h/lioON9qCjI59mJF+fvq4Em+RQX/KPy3QSAY7IfcQkl1LtEdMYvLZtGmG4jZLLGU0/O5i7vqyrsFBTtIABb1zrjyAIvXBLE8s7pZwlrbPoUCrYby5qXjD0M1mpocEqEsJjcbAEucZJOKpKlt2NcGsHp/ZJOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018728; c=relaxed/simple;
	bh=bYf9RFdl8p66htdOPoIUdaRvk7iewrH4NRDqepacMAc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+jRnNScAzTItatoZvQZ95ygk1E/4jYrHA+nmj8wIf/L+PfjUvP5zTip4JgBK3zoG8xGmS5codbXoT/8q8Y4MowJXS5W7T25UWuMsN8AkL/BmFaC0DzyBktU7PkHRcR6OcyobywkxhnXlZryD6OFhks0h6asZ9i02GnIfAIb2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id EA89E160112;
	Tue, 12 Aug 2025 17:12:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 29B8320028;
	Tue, 12 Aug 2025 17:12:03 +0000 (UTC)
Date: Tue, 12 Aug 2025 13:12:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: paulmck@kernel.org, Sasha Levin <sashal@kernel.org>, "Luck, Tony"
 <tony.luck@intel.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250812131248.6b49f0cd@gandalf.local.home>
In-Reply-To: <13a6b4cb-6566-4afa-b76f-bd18ce23ce18@kernel.org>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpnStlxDUsGNPuA@agluck-desk3>
	<aJpupN1KztXyglnN@lappy>
	<20250812114956.40dbb2fe@gandalf.local.home>
	<c1ea68c1-c352-40b5-a68a-790f618bb221@kernel.org>
	<743df9f7-70ff-4038-bec1-2fc938711be0@paulmck-laptop>
	<13a6b4cb-6566-4afa-b76f-bd18ce23ce18@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ypwegh7rc67buwt8zrz3ws18pard6zxw
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 29B8320028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/1MtGyXwtrk02C0SkmF1++BcznFO3alQg=
X-HE-Tag: 1755018723-676461
X-HE-Meta: U2FsdGVkX1+CnNDlKXNfk0Nh1GxrKTaDS/uqw8ChaHiWuNTaUBTBfPGzPQPnuTlDwk9WCRHmPjZzG4I0y/jAYiecUEKjIcjqJ2vq8Gg3n4KcddpODOr781y6W+hB3/ZQGA28ARwR5OL8I6y8XL7lSYuCMxLVHjO+Sp4v/JfiPkmX6SxaSSOjclqwymk8iUG4x83/cuGxtdVWwJuz7OB/Gb1qdDRyWeOjG3r8PdAO43BnBixqh14Pdl+cXxeXPFBcgv2u9HOh2NJARSSLuFm2pLCH2yLYdxyUkERK2d8D8zsWXQolHg1nSQ7EI0fs6ryu2PQnHCiHQ6YRkqP/t7EH41wWNaIbWGoTn5OanHAanXIfdxSa85tzfOfKRvg+d8ticOXCB9+f9nuLYYY3m3llCg==

On Tue, 12 Aug 2025 18:17:46 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > Applying a patch containing the first tag might not be wise, either,
> > depending on the outcome of a number of lawsuits currently in flight.
> > Plus there are a lot of other countries that might choose to weigh in.  
> 
> Yes, that's what I wanted to imply. At least person applying the patch
> and then later sending in pull request to next maintainer could not use
> excuse "I did not know, that Assisted-by causes legal risk".

Once you add your SoB, it means "You know". As described in the Submitting
Patches documentation:

  Developer's Certificate of Origin 1.1 
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

  By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or 

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

  then you just add a line saying::
 
        Signed-off-by: Random J Developer <random@developer.example.org>


If you add your SOB and then find out later that your AI tool added some
code that was not allowed, then you broke (a) and (b), and I believe you
are legally liable because your SoB means "You know". If you don't know,
then you should *not* be submitting the code.

-- Steve


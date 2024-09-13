Return-Path: <ksummit+bounces-1569-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF697808E
	for <lists@lfdr.de>; Fri, 13 Sep 2024 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DFD285E5B
	for <lists@lfdr.de>; Fri, 13 Sep 2024 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC47B1DA62B;
	Fri, 13 Sep 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="kNToORVT"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6021BAED2
	for <ksummit@lists.linux.dev>; Fri, 13 Sep 2024 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726232002; cv=none; b=ro/l/8QIqxDwaw93t+rvJp63uDtEe2roqPMiHq8rj7BwHrjGIUAFJx63iR2fnHFLdA48432+gz0q2aBn/+2lV1htsdfHw7Gx+yiYxeV5DqkrZjoQ2XALan9vKqTch3f8fb2+MirngZhCOLyfDHUeo9i6PK4GXK0Hw7+HXkk8OdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726232002; c=relaxed/simple;
	bh=9uoCslXWrUJtEkK7xGYlBEkVHPRAbh7t5j9cvgK0aHY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htG4PGeif8anXDJxgJNyNk0K3qggeejWxhe5RL4zpcngJkwgNgFE3O25mFaIx9AgP9EhVhN0OWq41bgz9Wg02/EgahEKlTG9CO21ItkD2yVywBKcvif7Gn0GRL78grXgBvP9W015mdVZaLoc7stekXtBOdkHRQdjpIEIff9lQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=kNToORVT; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-114-215.bstnma.fios.verizon.net [173.48.114.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 48DCrAxT010618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1726231992; bh=5wWozeTip8KWEDX/hyPIu4SKu6c7cS9YCDiwbp5J6x0=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=kNToORVTA0EwQf6+Y2dRBmPzVFNy630mDrPIEsspkulrOfgoi0sXXqSDDetoVV4dr
	 iCdmUEbY0LxME05AT7IcfjJ+xSTtQVo0+vNterRyMVkD8C5Y+WvwNqcKK1sV39kyrF
	 Fud3syAf5ZfPOx52hrdsZ5nN//AgqKlpZjumM7QNO/RYczG1ON5TLtRH5hnjyObkpp
	 7+6xx3m7OS0Dc/VBChuEnvmJQ0ECVuTXj8Em/vzykYHg5nvzqFH11IGPDnw9yIiSeD
	 W3M3BrMo3/+aVZeDmrPxyW8X3aFhF6KkJs0gcU0lUM47KzyFuIAPN79HMWt3Nmfnzi
	 dtf08PIkSf5vg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id B0D8915C19A9; Fri, 13 Sep 2024 08:53:10 -0400 (EDT)
Date: Fri, 13 Sep 2024 08:53:10 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: ksummit@lists.linux.dev
Subject: Draft Agenda for the 2024 Maintainers Summit
Message-ID: <20240913125310.GA1706848@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is the draft of the Maintaines Summit agenda which has been sent
to all of the attendees.

				   
			 Maintainers Summit
			  September 17, 2024
			    Austria Center

8:00  Hot breakfast and morning refreshments
9:00  Welcome and Agenda Bashing - Ted Ts'o
9:30  Regression Tracking (Thorsten Lemmhuis)
10:00 Passthrough Considered Harmful? (Dan Willims, Jason Gunthorpe)
10:30 Break
11:00 Are we ready to Commit to Rust?
11:30 Development Tooling 
12:00 Lunch
1:30  OFAC and Maintainers (Greg K-H)
2:00  TBD
2:30  Group Photograph
3:00  Break
3:30  Free time
5:30  Transportation loads for dinner
6:00  Dinner at Trattoria Martinelli
          https://en.barbaro.at/trattoriamartinelli

------------------

Note:  To to make our limited time together more productive, we are
asking the Maintainers Summit to do some "prework" this year.  This
takes the form of reading some documentation / patches / email, and
reflecting on the Prework Questions ahead of time.


Regression Tracking (Thorsten Lemmhuis)
======================================

Proposal discussion threads:

   https://lore.kernel.org/fa806468-17c5-4b65-8a1e-4509d4ed6ea5@leemhuis.info
   https://lore.kernel.org/c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info

Prework questions:

a) Which subsystems do you think are doing a great job of handling
regressions, and why?

b)  Do you think regression tracking as performed by Thorsten with regzbot
is worth it or more of a nuisance?

c) What would you like to see changed or improved regarding regzbot or
the regression tracking efforts as performed by Thorsten?
     (Note: Thorsten is already aware that "subsystem specific views
     into regressions regzbot tracks" is obviously needed and heavily
     overdue, and is at the top of the todo list.)

Handy links:
   Regzbot:
       https://gitlab.com/knurd42/regzbot/

   Regressions Thorsten currently tracks using regzbot:
       https://linux-regtracking.leemhuis.info/regzbot/mainline/


Passthrough Considered Harmful? (Dan Willims, Jason Gunthorpe)
===============================

Original Proposal:
    https://lore.kernel.org/668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch

Prework:

Read the following links as background:

[1] https://lore.kernel.org/all/6-v3-960f17f90f17+516-fwctl_jgg@nvidia.com/
[2] https://lwn.net/Articles/955001/
[3] https://lwn.net/Articles/969383/
[4] http://lore.kernel.org/2fd48f87-2521-4c34-8589-dbb7e91bb1c8@suse.com

Prework questions:

a) Are the restrictions in scope and rules to assure appropriate use
of fwctl as described in [2] sufficient?  If not, what are your
specific concerns and how would you suggest that they be addressd?

b) If fwctl is rejected will that increase hardware vendor upstream
participation on kernel wrapped uAPI development, or increase
shipment of out-of-tree bypasses that stress the ecosystem [4]?

c) If fwctl is accepted will that lead to undermining subsystem
development and injure end users, or will it result in better
support for end user flows that do not fit in a kernel wrapped
uAPI?

d) How far does a maintainer's ability to NACK a patch extend beyond
their core subsystem?  This question is equally relevant to the
discussion around the P4TC subsystem (https://lwn.net/Articles/977310/).


Are we ready to commit to Rust?
===============================

Prework questions:

a) Do we think that the adoption of Rust is going well, and how can it
be made to go better?

b) There are some definite disconnects between the Rust folks and
maintainers in various subsystems; how do we come closer to a common
vision of what we are trying to do?


Development Tooling for the Kernel
==================================

Prework:

If you haven't looked at them lately, please browse through the
kernel.org docs [1] and [2].  And if you missed Konstantin's
announcement, we can now use FIDO2 security keys to authenticate to
kernel.org[3].

[1] https://b4.docs.kernel.org
[2] https://korg.docs.kernel.org
[3] https://korg.docs.kernel.org/fido2.html

Prework questions:

a) Of the the current tools (b4, the lore kernel parchive, patchwork)
work for you today, which tools work well?  What can be improved, and
how?

b) What functionality is currently missing that would improve
maintainer and developer efficiency?



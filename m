Return-Path: <ksummit+bounces-770-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326B5B44F2
	for <lists@lfdr.de>; Sat, 10 Sep 2022 09:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EA441C20940
	for <lists@lfdr.de>; Sat, 10 Sep 2022 07:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEF8A5B;
	Sat, 10 Sep 2022 07:49:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FFA40
	for <ksummit@lists.linux.dev>; Sat, 10 Sep 2022 07:49:19 +0000 (UTC)
Received: from letrec.thunk.org ([212.23.229.83])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 28A7nAKl012046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Sep 2022 03:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1662796152; bh=oJzXXjSFtfx1nDTsExmO5nYJZcmGObR7Cn9iCvc/kKM=;
	h=Date:From:To:Subject;
	b=LcB2IKad/M7RV2biUK46e2Y1klwJ/VstT1jI7R5SLITNOlf3YOCEX5QHeGpw68f25
	 wxKcO1mIQE1fxkq0zSFv5Eu/jILYvJ0NvXJcAnuw5ubJUv4BMJScjbZCZNEtP2iaSZ
	 PfscXhYwh8S8MVlE0BKdRG4UHfE+aekgPTanqXc02j1cXfndT4OpCos1SSuaoYPM8q
	 JZo4nthsLez0RQsPsVDRigcaJoLAhhqSoV0W0eG5pL75LYOim4TzU5+6OEErYe9g9Q
	 6Lop4XTyZLARu1xRe5/qG31tZzP6kLAbrZjTbiOhLB0R8tlhLOU+bpH2B29RZapaXT
	 oT+8fSyziE+Nw==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 893E58C2B3B; Sat, 10 Sep 2022 03:49:11 -0400 (EDT)
Date: Sat, 10 Sep 2022 03:49:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: ksummit@lists.linux.dev
Subject: Agenda for the Maintainer's Summit 2022
Message-ID: <YxxBd2fO6MszBK6G@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


This is the planned agenda (subject to change, of course) for the
Maintainer's Summit.

					- Ted


			 Maintainer's Summit
			Clayton Hotel, Dublin
			  September 15, 2021


7:30  Hot breakfast and morning refreshments
9:00  Linus Torvalds gives a keynote at OSS EU
       (streaming available at the MS room)
10:30 Welcome and Agenda Bashing (Ted Ts'o)
11:30 Regression tracking & fixing: current state, problems, and next
      steps (Thorsten Lemmhuis)
12:00 Rust in the Kernel: Next steps (Miguel Ojeda)
12:30 Lunch
13:30 eBPF: how far should we go (Jiri Kosina)
14:00 <TBD>
14:30 Afternoon Break
15:00 Is Linus Happy?  
15:30 What went well, what can we do better?
16:00 Group Photograph
18:30 Attendee Dinner



Attendee List
-------------
Alexei Starovoitov
Borislav Petkov
Chris Mason
Christian Brauner
Cristoph Hellwig
Dave Airlie
Greg KH
Guenter Roeck
Jakub Kicinski
James Bottomley
Jens Axboe
Jiri Kosina
Jon Corbet
Kees Cook
Lars Eggert
Laurent Pinchart
Linus Torvalds
Marc Zyngier
Mark Brown
Matthew Wilcox
Miguel Ojeda
Paolo Bonzini
Rafael Wysocki
Sasha Levin
Steven Rostedt
Ted Ts'o
Thomas Gleixner
Thorsten Leemhuis

